*** Settings ***
Library          SeleniumLibrary
Library    XML
Resource         ../aula_3/setup_teardown.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${CAMPO_CRIAR}    id:form-botao

*** Test Cases ***
Verificar quando um campo obrigatório não for preenchido corretamente o sistema exibe uma mensagem de campo obrigatório
    Dado que eu clique no botão criar card
    Então o sistema deve apresentar mensagem de campo obrigatório

*** Keywords ***
Dado que eu clique no botão criar card
    Click Element    ${CAMPO_CRIAR}

Então o sistema deve apresentar mensagem de campo obrigatório
    Element Should Be Visible    id:form-nome-erro
    Element Should Be Visible    id:form-cargo-erro
    Element Should Be Visible    id:form-times-erro