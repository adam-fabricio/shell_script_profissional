# c10_bantex.sh

#-----------------------------------------------------------------------------#
#	Gerenciadro do Banco Textual
#	
#	Biblioteca de funções para gerenciar os dados do banco textual. Use o
#	comando "source" para inclui-la em seu script
#-----------------------------------------------------------------------------#
#	Autor:
#		Adam Fabricio Silveira Silva
#-----------------------------------------------------------------------------#
#	Histórico:
#		V0.1	-	14/10/2022	-	Adam:
#			- Cadastra e remove registro do banco
#		v0.2 	-	14/10/2022	-	Adam:
#			- Adicionado função tem_cahve()
#			- Inserção e exclusão agora checam antes a existencia 
#			- Adicionada mensagens informativas na inserção e exclusão
#-----------------------------------------------------------------------------#
#
#----------------------------------Configurações------------------------------#

SEP=:								#  defina aqui o separador, o padrão é ":"
TEMP=temp.$$						#  arquivo temporário

#------------------------------------Funções----------------------------------#
#  O arquivo de texto com o banco já deve estar definido

[ "$BANCO" ] || {
	echo "Base de dados não informada. Use a varável BANCO."
	return 1
}
#  Apaga o registro da chave $1 do banco
apaga_registro() {
	tem_chave "$1" || return						#  Se não tem, nem tente
	grep -i -v "^$1$SEP" "$BANCO" > "$TEMP"			#  apaga a chave
	mv "$TEMP" "$BANCO"								#  regrava o banco
	echo "O registro '$1' foi apagado."
}

#  Insere o registro $* no banco
insere_registro() {
	local chave=$(echo "$1" | cut -d $SEP -f1)		# Pega o primeiro campo
	if tem_chave "$chave"; then
		echo "A chave '$chave' já está cadastrada no banco"
		return 1
	else
		echo "$*" >> "$BANCO"						#  grava o registro
		echo "Registro de '$chave' cadastrado com sucesso."
	fi
	return 0
}

#  Verifica se a chave $1 está no banco
tem_chave() {
	grep -i -q "^$1$SEP" "$BANCO" 
}

#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------#

