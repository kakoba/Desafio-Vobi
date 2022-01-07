#language: pt

Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da Vobi

    @login
    Cenario: Login do usuário
        Dado que acesso a página principal
        Quando submeto minhas credenciais com "futuro2@vobi.com.br" e "Vobi1331"
        E clico no botão Entrar
        Então na home deveremos ver a mensagem "Olá, Escritório"