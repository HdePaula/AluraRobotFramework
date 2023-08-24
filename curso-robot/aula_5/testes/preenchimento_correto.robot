*** Settings ***
Resource         ../resources/main.robot
Test Setup       Dado que eu acesse o Organo
Test Teardown    Fechar o navegador

*** Variables ***
${CAMPO_NOME}      id:form-nome
${CAMPO_CARGO}     id:form-cargo
${CAMPO_IMAGEM}    id:form-imagem
${CAMPO_TIME}      class:lista-suspensa
${CAMPO_CRIAR}     id:form-botao

#lista
@{Seleciona_time}
...    xpath://option[contains(.,'Programação')]
...    xpath://option[contains(.,'Front-End')]
...    xpath://option[contains(.,'Data Science')]
...    xpath://option[contains(.,'Devops')]
...    xpath://option[contains(.,'UX e Design')]
...    xpath://option[contains(.,'Mobile')]
...    xpath://option[contains(.,'Inovação e Gestão')]

*** Test Cases ***
Verificar se ao preencer os campos corretamente um novo card é criado no time esperado
    Dado que eu preencha os campos
    E clique no botão criar card
    Então identificar o card no time esperado

Verificar se é possível criar mais de um card
    Dado que eu preencha os campos
    E clique no botão criar card
    Então identifica 3 cards no time esperado

Verificar se é possível criar um card para cada time preenchendo os campos corretamente
    Então cria e identifica 1 card em cada time disponível

*** Keywords ***
Dado que eu preencha os campos
    ${Nome}          FakerLibrary.First Name
    Input Text       ${CAMPO_NOME}      ${Nome}
    ${Cargo}         FakerLibrary.Job
    Input Text       ${CAMPO_CARGO}     ${Cargo}
    ${Imagem}        FakerLibrary.Image Url    width=100    height=100
    Input Text       ${CAMPO_IMAGEM}    ${Imagem}
    Click Element    ${CAMPO_TIME}
    Click Element    ${Seleciona_time}[0]

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

Então cria e identifica 1 card em cada time disponível
    FOR    ${index}    ${Time}    IN ENUMERATE    @{Seleciona_time}
        Dado que eu preencha os campos
        Click Element    ${Time}
        E clique no botão criar card
    END
    Sleep    10s

