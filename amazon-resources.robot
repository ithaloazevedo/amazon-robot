*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                 https://www.amazon.com.br/
${LOGO}                //a[@aria-label='Amazon.com.br'] 
${PRODUCT_LOCATOR}     //li[contains(@aria-posinset,'1')]



*** Keywords ***
Abrir Browser
    Open Browser     browser=chrome
    Maximize Browser Window

Fechar Browser
    Close Browser

Acessar a homepage  
    Go To    url=${URL}
    Wait Until Element Is Visible     locator=${LOGO}

Entrar no menu "${MENU}"
    # Click Element    //a[@class='nav-a  '][contains(.,'${MENU}')]
    Click Element    //a[contains(.,'${MENU}')]

Validar se o título da página é "${TITULO}"
    Wait Until Element Is Visible     locator=${LOGO}
    Title Should Be    title=${TITULO}

Validar se aparece a categoria "${CATEGORIA}"
    Wait Until Element Is Visible    locator=//a[contains(@aria-label,'${CATEGORIA}')]
    Element Should Be Visible    locator=//a[contains(@aria-label,'${CATEGORIA}')]

Pesquisar por "${PRODUTO}"
    Element Should Be Visible    locator=//input[contains(@aria-label,'Pesquisa')]
    Input Text    locator=//input[contains(@aria-label,'Pesquisa')]    text=${PRODUTO} 
    Click Button    locator=//input[contains(@id,'nav-search-submit-button')]


Validar textos da página de resultados da pesquisa é "${PRODUTO}"  
    # Texto da barra de pesquisa
    Wait Until Element Is Visible    locator=//span[@class="a-color-state a-text-bold" and contains(text(),"${PRODUTO}")]
    Element Should Be Visible    locator=//span[@class="a-color-state a-text-bold" and contains(text(),"${PRODUTO}")]
    # Texto do número de resultados da pesquisa
    Element Text Should Be    locator=//span[@class="a-color-state a-text-bold" and contains(text(),"${PRODUTO}")]   expected="${PRODUTO}"
    Sleep    10s

# Obter informações e selecionar o produto "${N_PRODUTO}"
#     Wait Until Element Is Visible   locator=//li[contains(@aria-posinset,'${N_PRODUTO}')]
#     ${NOME_PRODUTO}=                Get Text    //li[@aria-posinset="${N_PRODUTO}"]//div//a//span//span[@class="a-truncate-cut"]
#     Log To Console                  message=${NOME_PRODUTO}
#     ${VALOR_PRODUTO}=               Get Text    (//span[@class='a-price acs-product-block__price--buying']//span[@class='a-offscreen'])[${N_PRODUTO}]
#     Log To Console                  message=${VALOR_PRODUTO}
#     Click Element                   locator=//li[@aria-posinset="${N_PRODUTO}"]//div//a//span//span[@class="a-truncate-cut"]
#     Sleep    10s

# Validar informações da página do produto "${N_PRODUTO}"
#     Obter informações e selecionar o produto "${N_PRODUTO}"
#     Wait Until Element Is Visible   locator=//span[contains(@id,'productTitle')]
#     Element Text Should Be    locator=//span[contains(@id,'productTitle')]    expected=${NOME_PRODUTO}

Obter informações e selecionar o produto "${N_PRODUTO}"
    Wait Until Element Is Visible   locator=//li[contains(@aria-posinset,'${N_PRODUTO}')]
    ${NOME_PRODUTO}=                Get Text    //li[@aria-posinset="${N_PRODUTO}"]//div//a//span//span[@class="a-truncate-cut"]
    Log To Console                  message=O nome do produto é: ${NOME_PRODUTO}
    ${VALOR_PRODUTO}=               Get Text    (//span[@class='a-price acs-product-block__price--buying']//span[@class='a-offscreen'])[${N_PRODUTO}]
    Log To Console                  message=O valor do produto é: ${VALOR_PRODUTO}
    Click Element                   locator=//li[@aria-posinset="${N_PRODUTO}"]//div//a//span//span[@class="a-truncate-cut"]
    # Validar informações da página do produto 
    Wait Until Element Is Visible   locator=//span[contains(@id,'productTitle')]
    Element Text Should Be          locator=//span[contains(@id,'productTitle')]    expected=${NOME_PRODUTO}
    Sleep    10s