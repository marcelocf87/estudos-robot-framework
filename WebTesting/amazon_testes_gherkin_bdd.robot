"""
@author Marcelo Custódio Freitas
@version 1.0
@since 20/03/2023
"""


*** Settings ***
Documentation    Essa suíte testa o site da Amazon.com.br
Resource         amazon.resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]  Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...              e verifica a categoria Computadores e Informática
    [Tags]           menus
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página


Caso de teste 02 - Pesquisa de um produto
    [Documentation]  Esse teste verifica a busca de um produto
    [Tags]           busca 
    Dado que estou na home page da Amazon.com.br
    # Quando pesquisar pelo produto "Xbox Series S"
    # Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    # E um produto da linha "Xbox Series S" deve ser mostrado na página


    # python -m robot -i busca WebTesting/amazon_testes_gherkin_bdd.robot