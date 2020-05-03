################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/qtmr_inputcapture_outputpwm.c \
../source/semihost_hardfault.c 

OBJS += \
./source/qtmr_inputcapture_outputpwm.o \
./source/semihost_hardfault.o 

C_DEPS += \
./source/qtmr_inputcapture_outputpwm.d \
./source/semihost_hardfault.d 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MIMXRT1021DAG5A -DCPU_MIMXRT1021DAG5A_cm7 -DXIP_EXTERNAL_FLASH=1 -DXIP_BOOT_HEADER_ENABLE=1 -DSERIAL_PORT_TYPE_UART=1 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -DSDK_DEBUGCONSOLE=0 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/utilities" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/drivers" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/CMSIS" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/serial_manager" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/device" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/uart" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/xip" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/lists" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/board" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/source" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/drivers" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/device" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/CMSIS" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/utilities" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/serial_manager" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/lists" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/component/uart" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_qtmr_inputcapture_outputpwm/xip" -O0 -fno-common -g3 -Wall -c  -ffunction-sections  -fdata-sections  -ffreestanding  -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m7 -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


