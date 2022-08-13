#!/bin/bash
# 
# nome_completo.sh - Busca o nome completo de um usário no Unix
# 
# Site        : http://programas.com.br/nomecompleto/
# Autor       : João Silva <joao@email.com.br>
# Manutenação : Maria Teixeira <maria@email.com.br>
# 
#  -------------------------------------------------------------
#  Este programa recebe como parâmetro o login de um usário e
#  procura em várias bases qual o seu nome completo, retornando
#  o resultado na saida padrão (STDOUT)
# 
#  Exemplo:
#     $ ./nome_completo.sh jose
#     José Moreira
#     $ ./nome_completo.sh joseee
#     $
# 
# A ordem de procura do nome completo é sequencial:
# 
#     1. Arquivo /etc/passwd
#     2. Arquivo $HOME/.plan
#     3. Base de Usuário LDAP
#     4. Base de Usuário MySQL
# 
#  Respeitando a ordem, o primeiro resultado encontrado será o
#  retornando.
#  --------------------------------------------------------------
# 
# 
# Histórico:
# 
#     V1.0 1999-05-18, João Silva:
#         - Versão inicial procurando no /etc/passwd
#     v1.1 1999-08-02, João Silva:
#         - Adicionado pesquisa no $HOME/.plan
#         - Corrigido bug com nomes acentuados
#     V2.0 2000-04-28, Mário Rocha:
#         - Corrigido 2.534 bugs (O João não sabe programar!)
#         - Adicionado meu nome em vários lugares hehehehe
#     v2.1 2000-05-02, Jose Moreira:
#         - Desfeitas as "correções" do Mário (ele quebrou o programa)
#         - Retirada a frase "Mario é o Maior" de várias partes
#     v2.2 2000-05-02, José Moreira:
#         - Adicionado Suporte a LDAP (que trabalheira)
#         - Aceita nomes de usuário EM MAIÚSCULAS
#         - Retirado suporte a acentuação (estraga meu terminal)
#     v2.3 2000-05-03, José Moreira:
#         - Arrumado o suporte a LDAP (agora vai funcionar)
#     v2.4 2000-05-04, José Moreira:
#         - Arrumado o suporte a LDAP (agora é pra valer)
#     v2.5 2000-05-04, José Moreira:
#         - Retirado o suporte a LDAP ( eu odeio LDAP!)
#     v2.6 2000-05-10, Maria Texeira:
#         - Programa reescrito do zero
#         - Adicionado suporte a LDAP (Funciona)
#         - Adicionado suporte a MySQL
#         - Restaurado suporte a acentuação
#     v3.1 2003-05-10, Maria Texeira:
#         -Adicionado este comentário para comemorar 3 anos sem
#         alteração 
# 
# 
#     Licença GPL
# 
