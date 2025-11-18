extends Node
var marmita_gelada_count = 10
var marmita_count = 0
var marmita_nutricao = 5

signal atualiza_a_ui
signal atualiza_a_fome

func adicionarMarmitaQuente():
	marmita_count = marmita_count + 1
	atualiza_a_ui.emit()
	#Signal pro player atualizar UI
	
func ComerMarmitaQuente():
	marmita_count = marmita_count - 1
	#Signal pro player atualizar fome
	atualiza_a_ui.emit()
	#Signal pro player atualizar UI
	atualiza_a_fome.emit()

func perderMarmitaFria():
	marmita_gelada_count = marmita_gelada_count - 1
	atualiza_a_ui.emit()
	#Signal pro player atualizar UI

func adicionarMarmitaFria(value: int):
	marmita_gelada_count = marmita_gelada_count + value
	atualiza_a_ui.emit()
	#Signal pro player atualizar UI
