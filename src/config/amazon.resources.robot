"""
@author Marcelo Custódio Freitas
@version 1.0
@since 20/03/2023
"""


*** Settings ***
Documentation    Aqui estarão presentes todas as chamadas de libraries, resources e variáveis
Library    SeleniumLibrary


*** Variables ***
${URL}                         https://www.amazon.com.br
${TIMEOUT}                     3
${MENU_ELETRONICOS}            //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}          //h1[contains(.,'Eletrônicos e Tecnologia')]  
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia
${CLICK_PRODUTO}               (//span[contains(@class,'a-size-base-plus a-color-base a-text-normal')])[1] 
${ADICIONAR_PRODUTO}           (//input[@title='Adicionar ao carrinho'])
${VERIFICAR_PRODUTO}           (//span[contains(.,'Adicionado ao carrinho')]) 
${BOTAO_CARRINHO}              (//a[contains(@data-csa-c-type,'button')])
${REMOVER_PRODUTO}             (//input[@value='Excluir'])
${CARRINHO_VAZIO}              (//h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')])


*** Keywords ***
Abrir o navegador
    Open Browser    browser=edge
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[@aria-label='${NOME_CATEGORIA}']    

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=//h2[@class='a-size-mini a-spacing-none a-color-base s-line-clamp-4'][contains(.,'Console Xbox Series S')]
    Sleep    ${TIMEOUT}

Verificar se o título fica "${TITULO}"
    Title Should Be    title=${TITULO}

Clicar no produto    
    Click Element    locator=${CLICK_PRODUTO}
    Sleep    ${TIMEOUT}

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    locator=${ADICIONAR_PRODUTO}
    Sleep    ${TIMEOUT}
    
Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso    
    Wait Until Element Is Visible    locator=${VERIFICAR_PRODUTO}
    Sleep    ${TIMEOUT}

Clicar no botão de carrinho
    Click Element    locator=${BOTAO_CARRINHO}
    Sleep    ${TIMEOUT}

Remover o produto "Console Xbox Series S" do carrinho
    Click Element    locator=${REMOVER_PRODUTO}
    Sleep    ${TIMEOUT}

Verificar se o carrinho fica vazio 
    Wait Until Element Is Visible    locator=${CARRINHO_VAZIO}
    Sleep    ${TIMEOUT}
      
#GHERKIN STEPS
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
        
Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br" 

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página 
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página        
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"
    
E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa listando o produto "Xbox Series S" 

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Clicar no produto 
    Adicionar o produto "Console Xbox Series S" no carrinho
    
Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Clicar no produto 
    Adicionar o produto "Console Xbox Series S" no carrinho

Quando remover o produto "Console Xbox Series S" do carrinho
    Clicar no botão de carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio