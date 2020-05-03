################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/fsl_clock.c \
../drivers/fsl_common.c \
../drivers/fsl_gpio.c \
../drivers/fsl_gpt.c \
../drivers/fsl_lpi2c.c \
../drivers/fsl_lpspi.c \
../drivers/fsl_lpuart.c \
../drivers/fsl_pit.c 

OBJS += \
./drivers/fsl_clock.o \
./drivers/fsl_common.o \
./drivers/fsl_gpio.o \
./drivers/fsl_gpt.o \
./drivers/fsl_lpi2c.o \
./drivers/fsl_lpspi.o \
./drivers/fsl_lpuart.o \
./drivers/fsl_pit.o 

C_DEPS += \
./drivers/fsl_clock.d \
./drivers/fsl_common.d \
./drivers/fsl_gpio.d \
./drivers/fsl_gpt.d \
./drivers/fsl_lpi2c.d \
./drivers/fsl_lpspi.d \
./drivers/fsl_lpuart.d \
./drivers/fsl_pit.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/%.o: ../drivers/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_MIMXRT1021DAG5A -DCPU_MIMXRT1021DAG5A_cm7 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -DXIP_EXTERNAL_FLASH=1 -DXIP_BOOT_HEADER_ENABLE=1 -DXIP_BOOY_HEADER_DCD_ENABLE=1 -DSKIP_SYSCLK_INIT -DSERIAL_PORT_TYPE_UART=1 -DFSL_RTOS_FREE_RTOS -DSDK_OS_FREE_RTOS -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/board" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/source" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/drivers" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/device" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/CMSIS" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/xip" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/utilities" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/component/serial_manager" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/component/lists" -I"/home/bop/Documents/MCUXpresso_11.1.0_3209/workspace/MIMXRT1021gpio_Project/component/uart" -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -fmerge-constants -fmacro-prefix-map="../$(@D)/"=. -mcpu=cortex-m7 -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


