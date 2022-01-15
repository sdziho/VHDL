transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/sadzi/Desktop/LAB11/programski_brojac.vhd}
vcom -93 -work work {C:/Users/sadzi/Desktop/LAB11/rom.vhd}
vcom -93 -work work {C:/Users/sadzi/Desktop/LAB11/stack.vhd}
vcom -93 -work work {C:/Users/sadzi/Desktop/LAB11/registar_stanja.vhd}
vcom -93 -work work {C:/Users/sadzi/Desktop/LAB11/I_R.vhd}
vcom -93 -work work {C:/Users/sadzi/Desktop/LAB11/u_jed.vhd}
vcom -93 -work work {C:/Users/sadzi/Desktop/LAB11/RAM_Rn_Ak.vhd}
vcom -93 -work work {C:/Users/sadzi/Desktop/LAB11/alu.vhd}
vcom -93 -work work {C:/Users/sadzi/Desktop/LAB11/moj_procesor.vhd}

