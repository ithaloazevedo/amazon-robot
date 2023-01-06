*** Settings ***
Documentation     Essa suite testa o site da Amazon
Test Setup        Abrir Browser
Test Teardown     Fechar Browser    
Resource          amazon-resources.robot

*** Test Cases ***

Caso de teste 01 - Acesso ao menu "Brinquedos e jogos"
    [Documentation]    Esse teste verifica o menu de brinquedos do site Amazon.com.br
    ...                e o nome de suas categorias
    [Tags]             menus
    Acessar a homepage
    Validar se o título da página é "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Brinquedos e Jogos"
    Validar se o título da página é "Brinquedos e Jogos | Amazon.com.br"
    Validar se aparece a categoria "Artes e Artesanato"
    Validar se aparece a categoria "Bonecos de Ação"
    Validar se aparece a categoria "Carrinhos"
    Validar se aparece a categoria "Fantasias"
    Validar se aparece a categoria "Jogos de Carta"
    Validar se aparece a categoria "Bonecas"

Caso de teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica a busca de um produto
    [Tags]             busca
    Acessar a homepage
    Validar se o título da página é "Amazon.com.br | Tudo pra você, de A a Z."
    Pesquisar por "echo dot"
    Validar textos da página de resultados da pesquisa é "echo dot"
    Validar se o título da página é "Amazon.com.br : echo dot"


Caso de teste 03 - Adicionar produto ao carrinho
    [Documentation]    Esse teste verifica o fluxo de compra de um produto
    Acessar a homepage
    Validar se o título da página é "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Livros"
    Validar se o título da página é "Livros | Amazon.com.br"
    Obter informações e selecionar o produto "1"
    

    
    
    