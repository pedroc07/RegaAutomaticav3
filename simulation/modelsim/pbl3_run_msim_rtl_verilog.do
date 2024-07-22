transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+/home/aluno/Downloads/RegaAutomaticav3 {/home/aluno/Downloads/RegaAutomaticav3/Irrigacao.v}
vlog -vlog01compat -work work +incdir+/home/aluno/Downloads/RegaAutomaticav3 {/home/aluno/Downloads/RegaAutomaticav3/mef_tiporega.v}
vlog -vlog01compat -work work +incdir+/home/aluno/Downloads/RegaAutomaticav3 {/home/aluno/Downloads/RegaAutomaticav3/main.v}
vlog -vlog01compat -work work +incdir+/home/aluno/Downloads/RegaAutomaticav3 {/home/aluno/Downloads/RegaAutomaticav3/cont_mod4.v}
vlog -vlog01compat -work work +incdir+/home/aluno/Downloads/RegaAutomaticav3 {/home/aluno/Downloads/RegaAutomaticav3/cont_mod16.v}
vlog -vlog01compat -work work +incdir+/home/aluno/Downloads/RegaAutomaticav3 {/home/aluno/Downloads/RegaAutomaticav3/DivisorClock.v}
vlog -vlog01compat -work work +incdir+/home/aluno/Downloads/RegaAutomaticav3 {/home/aluno/Downloads/RegaAutomaticav3/fft.v}
vlog -vlog01compat -work work +incdir+/home/aluno/Downloads/RegaAutomaticav3 {/home/aluno/Downloads/RegaAutomaticav3/decode.v}
vlog -vlog01compat -work work +incdir+/home/aluno/Downloads/RegaAutomaticav3 {/home/aluno/Downloads/RegaAutomaticav3/mef_adub_limp.v}

