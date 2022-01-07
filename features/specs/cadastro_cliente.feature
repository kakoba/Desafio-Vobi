#language: pt

Funcionalidade: Cadastro de pessoa física e jurídica
    Sendo um usuário logado no sistema
    Quero acessar o sistema da Vobi
    Para que eu possa cadastrar um cliente

    # Pré-condição do teste
    Contexto: Acessar o sistema como cliente
        Dado que acesso a página principal
        Quando submeto minhas credenciais com "futuro2@vobi.com.br" e "Vobi1331"
        E clico no botão Entrar
        Então na home deveremos ver a mensagem "Olá, Escritório"
        
        #Acessar Menu e Submenu de cadastro
        Dado acesso o menu Clientes e Fornecedores
        E e clico submenu Clientes
        E verifico que estou na página "Meus Clientes"

    @cadastro_pf
    Cenario: Cadastro de pessoa física
        Dado realizo o cadastro do cliente pessoa física
        Quando clico no botão salvar
        Então devo visualizar o email do cliente na página de clientes

    @cadastro_pj
    Cenario: Cadastro de pessoa jurídica
        Dado realizo o cadastro do cliente pessoa jurídica
        Quando clico no botão salvar
        Então devo visualizar o email do cliente na página de clientes
