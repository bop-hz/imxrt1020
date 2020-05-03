################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/fsl_clock.c \
../drivers/fsl_common.c \
../drivers/fsl_gpio.c \
../drivers/fsl_lpspi.c \
../drivers/fsl_lpuart.c \
../drivers/fsl_qtmr.c \
../drivers/fsl_xbara.c 

OBJS += \
./drivers/fsl_clock.o \
./drivers/fsl_common.o \
./drivers/fsl_gpio.o \
./drivers/fsl_lpspi.o \
./drivers/fsl_lpuart.o \
./drivers/fsl_qtmr.o \
./drivers/fsl_xbara.o 

C_DEPS += \
./drivers/fsl_clock.d \
./drivers/fsl_common.d \
./drivers/fsl_gpio.d \
./drivers/fsl_lpspi.d \
./drivers/fsl_lpuart.d \
./drivers/fsl_qtmr.d \
./drivers/fsl_xbara.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/%.o: ../drivers/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MIMXRT1021DAG5A -DCPU_MIMXRT1021DAG5A_cm7 -DXIP_EXTERNAL_FLASH=1 -DXIP_BOOT_HEADER_ENABLE=1 -DSERIAL_PORT_TYPE_UART=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DSDK_DEBUGCONSOLE=0 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/utilities" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/drivers" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/CMSIS" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/serial_manager" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/device" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/uart" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/xip" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/lists" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/board" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/source" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/drivers" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/device" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/CMSIS" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/utilities" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/serial_manager" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/lists" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/uart" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/xip" -O0 -fno-common -g3 -Wall -c  -ffunction-sections  -fdata-sections  -ffreestanding  -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m7 -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


