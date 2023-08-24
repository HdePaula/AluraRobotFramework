*** Settings ***
Library          SeleniumLibrary
Resource         ../aula_3/setup_teardown.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${CAMPO_CRIAR}     id:form-botao
${PROGRAMACAO}     xpath://option[contains(.,'Programação')]
${FRONT_END}       xpath://option[contains(.,'Front_End')]
${DADOS}           xpath://option[contains(.,'Data Science')]
${DEVOPS}          xpath://option[contains(.,'Devops')]
${UX}              xpath://option[contains(.,'UX e Design')]
${MOBILE}          xpath://option[contains(.,'Mobile')]
${INOVACAO}        xpath://option[contains(.,'Inovação e Gestão')]

*** Test Cases ***
Verificar se ao preencer os campos corretamente um novo card é criado no time esperado
    Dado que eu preencha os campos
    E clique no botão criar card
    Então identificar o card no time esperado

Verificar se é possivel criar mais de um card
    Dado que eu preencha os campos
    E clique no botão criar card
    Então identifica 3 cards no time esperado

*** Keywords ***
Dado que eu preencha os campos
    Input Text       ${CAMPO_NOME}      Henrique
    Input Text       ${CAMPO_CARGO}     Programador
    Input Text       ${CAMPO_IMAGEM}    https://picsum.photos/200/300
    Click Element    ${CAMPO_TIME}
    Click Element    ${PROGRAMACAO}

E clique no botão criar card
    Click Button    id:form-botao

Então identificar o card no time esperado
    Element Should Be Visible    class:colaborador

Então identifica 3 cards no time esperado
    FOR    ${cont}    IN RANGE    1    3
        Dado que eu preencha os campos
        E clique no botão criar card
    END
    Sleep    5s