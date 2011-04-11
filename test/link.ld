OUTPUT_FORMAT(elf32-littlearm)
OUTPUT_ARCH(arm)
/*STARTUP(../obj/startup.o)*/
ENTRY(Reset_Handler)

MEMORY
{
  FLASH : ORIGIN = 0x0, LENGTH = 512K
  SRAM1 : ORIGIN = 0x10000000, LENGTH = 32K
/*  SRAM2 : ORIGIN = , LENGTH = */
}

REGION_ALIAS("REGION_TEXT", FLASH);
REGION_ALIAS("REGION_RODATA", FLASH);
REGION_ALIAS("REGION_DATA", SRAM1);
REGION_ALIAS("REGION_BSS", SRAM1);

SECTIONS
{
  . = 0x0;
/*
  .isr :
    {
      KEEP(*(.isr))
    } > REGION_TEXT
*/
  .text :
    {
      KEEP(*(.vectors))
      *(.text)
    } > REGION_TEXT
  .rodata :
    {
      *(.rodata)
    } > REGION_RODATA
  .data :
    {
      *(.data)
    } > REGION_DATA
  .bss :
    {
      _bss_start = .;
      KEEP(*(.bss))
    } > REGION_BSS
  _bss_size = SIZEOF(.bss);
}
