################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../device/system_MIMXRT1021.c 

OBJS += \
./device/system_MIMXRT1021.o 

C_DEPS += \
./device/system_MIMXRT1021.d 


# Each subdirectory must supply rules for building sources it contributes
device/%.o: ../device/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MIMXRT1021DAG5A -DCPU_MIMXRT1021DAG5A_cm7 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -DXIP_EXTERNAL_FLASH=1 -DXIP_BOOT_HEADER_ENABLE=1 -DSERIAL_PORT_TYPE_UART=1 -DFSL_RTOS_FREE_RTOS -DSDK_OS_FREE_RTOS -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/board" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/source" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/drivers" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/device" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/CMSIS" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/xip" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/utilities" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/component/serial_manager" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/component/lists" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/component/uart" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m7 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


