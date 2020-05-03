################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../xip/evkmimxrt1020_flexspi_nor_config.c \
../xip/evkmimxrt1020_sdram_ini_dcd.c \
../xip/fsl_flexspi_nor_boot.c 

OBJS += \
./xip/evkmimxrt1020_flexspi_nor_config.o \
./xip/evkmimxrt1020_sdram_ini_dcd.o \
./xip/fsl_flexspi_nor_boot.o 

C_DEPS += \
./xip/evkmimxrt1020_flexspi_nor_config.d \
./xip/evkmimxrt1020_sdram_ini_dcd.d \
./xip/fsl_flexspi_nor_boot.d 


# Each subdirectory must supply rules for building sources it contributes
xip/%.o: ../xip/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MIMXRT1021DAG5A -DCPU_MIMXRT1021DAG5A_cm7 -DXIP_EXTERNAL_FLASH=1 -DXIP_BOOT_HEADER_ENABLE=1 -DSERIAL_PORT_TYPE_UART=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DSDK_DEBUGCONSOLE=0 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/utilities" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/drivers" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/CMSIS" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/serial_manager" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/device" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/uart" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/xip" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/lists" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/board" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/source" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/drivers" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/device" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/CMSIS" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/utilities" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/serial_manager" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/lists" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/uart" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/xip" -O0 -fno-common -g3 -Wall -c  -ffunction-sections  -fdata-sections  -ffreestanding  -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m7 -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


