ENTRY(Reset_Handler)

MEMORY
{
	FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 2048K
	SRAM (rwx) : ORIGIN = 0x20020000, LENGTH = 368K	
}

__max_heap_size = 0x400;
__max_stack_size = 0x200;

SECTIONS
{

	.text :
	{
		_stext = .;
		*(.isr_vector)
		*(.text)
		*(.rodata)
		. = ALIGN(4);
		_etext = .;

	}> FLASH AT> FLASH

	_la_data = LOADADDR(.data);
	.data :
	{
		_sdata = .;
		*(.data)
		. = ALIGN(4);
		_edata = .;

	}> SRAM AT> FLASH

	.bss :
	{
		_sbss = .;
		__bss_start__ = _sbss;
		*(.bss)
		. = ALIGN(4);
		_ebss = .;
		__bss_end__ = _ebss;
		. = ALIGN(4);
		_exit = .;
	}>SRAM

	.all_the_rest_ignored :
	{
		*(.glue_7)
		*(.glue_7t)
		*(.vfp11_veneer)
		*(.v4_bx)
		*(.iplt)
		*(.rel)
		*(.rel_dyn)
		*(.rel_ipit)
	}> FLASH
}