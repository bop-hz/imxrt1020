################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../utilities/fsl_assert.c \
../utilities/fsl_debug_console.c \
../utilities/fsl_str.c 

OBJS += \
./utilities/fsl_assert.o \
./utilities/fsl_debug_console.o \
./utilities/fsl_str.o 

C_DEPS += \
./utilities/fsl_assert.d \
./utilities/fsl_debug_console.d \
./utilities/fsl_str.d 


# Each subdirectory must supply rules for building sources it contributes
utilities/%.o: ../utilities/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -std=gnu99 -D__REDLIB__ -DCPU_MIMXRT1021DAG5A -DCPU_MIMXRT1021DAG5A_cm7 -DXIP_BOOT_HEADER_DCD_ENABLE=1 -DSKIP_SYSCLK_INIT -DSDK_DEBUGCONSOLE=1 -DXIP_EXTERNAL_FLASH=1 -DXIP_BOOT_HEADER_ENABLE=1 -DPRINTF_FLOAT_ENABLE=0 -DSCANF_FLOAT_ENABLE=0 -DPRINTF_ADVANCED_ENABLE=0 -DSCANF_ADVANCED_ENABLE=0 -DSERIAL_PORT_TYPE_UART=1 -DCR_INTEGER_PRINTF -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_hello_world/board" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_hello_world/source" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_hello_world" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_hello_world/drivers" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_hello_world/device" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_hello_world/CMSIS" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_hello_world/utilities" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_hello_world/component/serial_manager" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_hello_world/component/lists" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_hello_world/component/uart" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/evkmimxrt1020_hello_world/xip" -O0 -fno-common -g3 -Wall -c  -ffunction-sections  -fdata-sections  -ffreestanding  -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m7 -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


