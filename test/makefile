
TARGET		=	arm-none-eabi
AS		=	$(TARGET)-as
ADA		=	$(TARGET)-gnatmake

ADAFLAGS	=	--RTS=$(RTS)/boards/xpresso1769

OBJS		=	obj/isr.o
ALIS		=	obj/isr.ali 

all: test

test: src/test.adb src/isr.adb src/isr.ads
	$(ADA) $(ADAFLAGS) -Ptest.gpr -bargs -aO./obj


obj/isr.o obj/isr.ali: src/isr.adb src/isr.ads
#	$(ADA) $(ADAFLAGS) -mcpu=cortex-m3 -mthumb -g -D obj -c $<

.PHONY: clean

clean:
	-rm -rf test obj/*
