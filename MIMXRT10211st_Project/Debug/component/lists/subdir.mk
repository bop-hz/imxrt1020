################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../component/lists/generic_list.c 

OBJS += \
./component/lists/generic_list.o 

C_DEPS += \
./component/lists/generic_list.d 


# Each subdirectory must supply rules for building sources it contributes
component/lists/%.o: ../component/lists/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MIMXRT1021DAG5A -DCPU_MIMXRT1021DAG5A_cm7 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -DXIP_EXTERNAL_FLASH=1 -DXIP_BOOT_HEADER_ENABLE=1 -DSERIAL_PORT_TYPE_UART=1 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT10211st_Project/board" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT10211st_Project/source" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT10211st_Project" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT10211st_Project/drivers" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT10211st_Project/device" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT10211st_Project/CMSIS" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT10211st_Project/xip" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT10211st_Project/utilities" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT10211st_Project/component/serial_manager" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT10211st_Project/component/lists" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT10211st_Project/component/uart" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m7 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


