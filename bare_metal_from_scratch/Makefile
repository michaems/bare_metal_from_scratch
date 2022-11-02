CC=arm-none-eabi-gcc
LD=arm-none-eabi-ld
MACH=cortex-m7
CFLAGS= -c -mcpu=$(MACH) -mthumb -mfloat-abi=soft -std=gnu11 -O0 -Wall --specs=nosys.specs

INC=-I Inc
SRC=Src
OUT=bin

LDFLAGS= -mcpu=$(MACH) -mthumb -mfloat-abi=soft --specs=nano.specs -T $(SRC)/stm32_ls.ld -Wl,-Map=blinker_v2.map


all : $(OUT)/main.o $(OUT)/stm32_startup.o blinker_v2.elf

$(OUT)/main.o : $(SRC)/main.c
	$(CC) $(INC) $(CFLAGS) -o $@ $^


$(OUT)/stm32_startup.o : $(SRC)/stm32_startup.c
	$(CC) $(CFLAGS) -o $@ $^


blinker_v2.elf : $(OUT)/main.o $(OUT)/stm32_startup.o
	$(CC) $(LDFLAGS) -o $@ $^

clean :
	del $(OUT)\*.o *.elf *.map *.bin *.hex

load :
	openocd -f board/st_nucleo_f7.cfg