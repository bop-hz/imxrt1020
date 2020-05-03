/*
 * Copyright 2017-2019 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/*******************************************************************************
 * Includes
 ******************************************************************************/
#include "fsl_debug_console.h"
#include "board.h"
#include "fsl_qtmr.h"
#include "fsl_xbara.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "fsl_lpspi.h"
/*******************************************************************************
 * Definitions
 ******************************************************************************/
/* The QTMR instance/channel used for board */
#define BOARD_QTMR_BASEADDR TMR2
#define BOARD_QTMR_INPUT_CAPTURE_CHANNEL kQTMR_Channel_0
#define BOARD_QTMR_PWM_CHANNEL kQTMR_Channel_1
#define QTMR_CounterInputPin kQTMR_Counter0InputPin

#define DEMO_XBARA_BASEADDR XBARA
#define DEMO_XBARA_USER_CHANNEL_OUTPUT kXBARA1_OutputDmaChMuxReq30
#define DEMO_XBARA_USER_CHANNEL_INPUT  kXBARA1_InputQtimer2Tmr1
#define DEMO_XBARA_IRQn XBAR1_IRQ_0_1_IRQn
#define DEMO_XBARA_IRQHandler XBAR1_IRQ_0_1_IRQHandler
/* Interrupt number and interrupt handler for the QTMR instance used */
#define QTMR_IRQ_ID TMR2_IRQn
#define QTMR_IRQ_HANDLER TMR2_IRQHandler



#define EXAMPLE_LPSPI_MASTER_BASEADDR (LPSPI1)
#define EXAMPLE_LPSPI_MASTER_IRQN LPSPI1_IRQn
#define EXAMPLE_LPSPI_MASTER_IRQHandler LPSPI1_IRQHandler

#define EXAMPLE_LPSPI_MASTER_PCS_FOR_INIT (kLPSPI_Pcs0)
#define EXAMPLE_LPSPI_MASTER_PCS_FOR_TRANSFER (kLPSPI_MasterPcs0)
/* Select USB1 PLL PFD0 (720 MHz) as lpspi clock source */
#define EXAMPLE_LPSPI_CLOCK_SOURCE_SELECT (1U)
/* Clock divider for master lpspi clock source */
#define EXAMPLE_LPSPI_CLOCK_SOURCE_DIVIDER (7U)

#define LPSPI_MASTER_CLK_FREQ (CLOCK_GetFreq(kCLOCK_Usb1PllPfd0Clk) / (EXAMPLE_LPSPI_CLOCK_SOURCE_DIVIDER + 1U))
#define TRANSFER_BAUDRATE 1000000U /*! Transfer baudrate - 15M */

/* Get source clock for QTMR driver */
#define QTMR_SOURCE_CLOCK CLOCK_GetFreq(kCLOCK_IpgClk)

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/

volatile bool qtmrIsrFlag = false;

/*******************************************************************************
 * Code
 ******************************************************************************/
void QTMR_IRQ_HANDLER(void)
{
    /* Clear interrupt flag.*/
    QTMR_ClearStatusFlags(BOARD_QTMR_BASEADDR, BOARD_QTMR_INPUT_CAPTURE_CHANNEL, kQTMR_EdgeFlag);

    qtmrIsrFlag = true;
    /* Add for ARM errata 838869, affects Cortex-M4, Cortex-M4F Store immediate overlapping
      exception return operation might vector to incorrect interrupt */
    __DSB();
}

void DEMO_XBARA_IRQHandler(void)
{
		if (XBARA_GetStatusFlags(DEMO_XBARA_BASEADDR) & kXBARA_EdgeDetectionOut0)
	    {
	        /* Clear interrupt flag. */
	        XBARA_ClearStatusFlags(DEMO_XBARA_BASEADDR, kXBARA_EdgeDetectionOut0);
	        LPSPI_WriteData(EXAMPLE_LPSPI_MASTER_BASEADDR, 0);

	    }
}

/*!
 * @brief Main function
 */
int main(void)
{
    qtmr_config_t qtmrConfig;
    xbara_control_config_t xbaraConfig;
    uint32_t counterClock = 0;
    uint32_t timeCapt     = 0;
    uint32_t count        = 0;
    uint32_t whichPcs                  = EXAMPLE_LPSPI_MASTER_PCS_FOR_INIT;
    uint8_t txWatermark;
    uint8_t g_masterRxWatermark;
    /* Board pin, clock, debug console init */
    BOARD_ConfigMPU();
    BOARD_InitPins();
    BOARD_BootClockRUN();
    BOARD_InitDebugConsole();

    XBARA_Init(DEMO_XBARA_BASEADDR);
    XBARA_SetSignalsConnection(DEMO_XBARA_BASEADDR, DEMO_XBARA_USER_CHANNEL_INPUT, DEMO_XBARA_USER_CHANNEL_OUTPUT);
    xbaraConfig.activeEdge = kXBARA_EdgeFalling;
    xbaraConfig.requestType = kXBARA_RequestInterruptEnalbe;
    XBARA_SetOutputSignalConfig(DEMO_XBARA_BASEADDR, DEMO_XBARA_USER_CHANNEL_OUTPUT, &xbaraConfig);
    EnableIRQ(DEMO_XBARA_IRQn);
    /*
     * qtmrConfig.debugMode = kQTMR_RunNormalInDebug;
     * qtmrConfig.enableExternalForce = false;
     * qtmrConfig.enableMasterMode = false;
     * qtmrConfig.faultFilterCount = 0;
     * qtmrConfig.faultFilterPeriod = 0;
     * qtmrConfig.primarySource = kQTMR_ClockDivide_2;
     * qtmrConfig.secondarySource = kQTMR_Counter0InputPin;
     */
    QTMR_GetDefaultConfig(&qtmrConfig);

    /* Init the first channel to use the IP Bus clock div by 8 */
    qtmrConfig.primarySource = kQTMR_ClockDivide_8;
    QTMR_Init(BOARD_QTMR_BASEADDR, BOARD_QTMR_INPUT_CAPTURE_CHANNEL, &qtmrConfig);

    /* Setup the input capture */
    QTMR_SetupInputCapture(BOARD_QTMR_BASEADDR, BOARD_QTMR_INPUT_CAPTURE_CHANNEL, QTMR_CounterInputPin, false, true,
                           kQTMR_RisingEdge);
    lpspi_master_config_t masterConfig;
    masterConfig.baudRate     = TRANSFER_BAUDRATE;
    masterConfig.bitsPerFrame = 8;
    masterConfig.cpol         = kLPSPI_ClockPolarityActiveHigh;
    masterConfig.cpha         = kLPSPI_ClockPhaseFirstEdge;
    masterConfig.direction    = kLPSPI_MsbFirst;
    masterConfig.whichPcs           = EXAMPLE_LPSPI_MASTER_PCS_FOR_INIT;
    masterConfig.pcsActiveHighOrLow = kLPSPI_PcsActiveLow;

    masterConfig.pinCfg        = kLPSPI_SdiInSdoOut;
    masterConfig.dataOutConfig = kLpspiDataOutRetained;
    uint32_t srcClock_Hz;
    srcClock_Hz = LPSPI_MASTER_CLK_FREQ;
    LPSPI_MasterInit(EXAMPLE_LPSPI_MASTER_BASEADDR, &masterConfig, srcClock_Hz);
    txWatermark         = 1;
    g_masterRxWatermark = 14;
    LPSPI_SetFifoWatermarks(EXAMPLE_LPSPI_MASTER_BASEADDR, txWatermark, g_masterRxWatermark);
    LPSPI_Enable(EXAMPLE_LPSPI_MASTER_BASEADDR, false);
    EXAMPLE_LPSPI_MASTER_BASEADDR->CFGR1 |= (LPSPI_CFGR1_NOSTALL_MASK);
    LPSPI_Enable(EXAMPLE_LPSPI_MASTER_BASEADDR, true);
    LPSPI_ClearStatusFlags(EXAMPLE_LPSPI_MASTER_BASEADDR, kLPSPI_AllStatusFlag);
       LPSPI_DisableInterrupts(EXAMPLE_LPSPI_MASTER_BASEADDR, kLPSPI_AllInterruptEnable);

       EXAMPLE_LPSPI_MASTER_BASEADDR->TCR =
           (EXAMPLE_LPSPI_MASTER_BASEADDR->TCR &
            ~(LPSPI_TCR_CONT_MASK | LPSPI_TCR_CONTC_MASK | LPSPI_TCR_RXMSK_MASK | LPSPI_TCR_PCS_MASK)) |
           LPSPI_TCR_CONT(0) | LPSPI_TCR_CONTC(0) | LPSPI_TCR_RXMSK(0) | LPSPI_TCR_TXMSK(0) | LPSPI_TCR_PCS(whichPcs);

    /* Enable at the NVIC */
   // EnableIRQ(QTMR_IRQ_ID);

    /* Enable timer compare interrupt */
    //QTMR_EnableInterrupts(BOARD_QTMR_BASEADDR, BOARD_QTMR_INPUT_CAPTURE_CHANNEL, kQTMR_EdgeInterruptEnable);

    /* Start the input channel to count on rising edge of the primary source clock */
    //QTMR_StartTimer(BOARD_QTMR_BASEADDR, BOARD_QTMR_INPUT_CAPTURE_CHANNEL, kQTMR_PriSrcRiseEdge);

    //counterClock = QTMR_SOURCE_CLOCK / 8000;

    /* Check whether occur interupt and wait the capture frequency stable */
   /* while (count < 5 || timeCapt == 0)
    {
        while (!(qtmrIsrFlag))
        {
        }
        qtmrIsrFlag = false;
        count++;
        timeCapt = BOARD_QTMR_BASEADDR->CHANNEL[BOARD_QTMR_INPUT_CAPTURE_CHANNEL].CAPT;
    }*/
    PRINTF("\r\nCaptured Period time=%d us\n", (timeCapt * 1000) / counterClock);

    PRINTF("\r\n****Output PWM example.****\n");
    PRINTF("\r\n*********Make sure to connect an oscilloscope.*********\n");
    PRINTF("\r\n****A 50% duty cycle PWM wave is observed on an oscilloscope.****\n");

    qtmrConfig.primarySource = kQTMR_ClockDivide_8;
    QTMR_Init(BOARD_QTMR_BASEADDR, BOARD_QTMR_PWM_CHANNEL, &qtmrConfig);

    /* Generate a 50Khz PWM signal with 50% dutycycle */
    QTMR_SetupPwm(BOARD_QTMR_BASEADDR, BOARD_QTMR_PWM_CHANNEL, 50000, 20, false, QTMR_SOURCE_CLOCK/8 );
    //LPSPI_WriteData(EXAMPLE_LPSPI_MASTER_BASEADDR, 0);
    /* Start the counter */
    QTMR_StartTimer(BOARD_QTMR_BASEADDR, BOARD_QTMR_PWM_CHANNEL, kQTMR_PriSrcRiseEdge);

    while (1)
    {


    }
}
