"""
@author Marcelo Custódio Freitas
@version 1.0
@since 20/03/2023
"""


*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         ../../src/config/amazon.resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...              e verifica a categoria Computadores e Informática
    [Tags]           menus
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"    
    Verificar se aparece a categoria "Computadores e Informática"


Caso de teste 02 - Pesquisa de um produto 
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca  
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar se o título fica "Amazon.com.br : Xbox Series S"
    Verificar o resultado da pesquisa listando o produto "Console Xbox Series S"


Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa listando o produto "Console Xbox Series S"
    Clicar no produto
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa listando o produto "Console Xbox Series S"
    Clicar no produto
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Clicar no botão de carrinho
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio


# Mostre para nós os testes que conseguiu automatizar no site da Amazon.com.br e cole o código de um desses testes aqui + o código da implementação das keywords desse teste.    


#  python -m robot -i 'tag' -d tests/logs tests/features/amazon_testes.robot