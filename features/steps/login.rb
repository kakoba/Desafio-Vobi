Dado("que acesso a página principal") do
  visit "/"
end

Quando("submeto minhas credenciais com {string} e {string}") do |email, senha|
  find("#email").set email
  find("#password").set senha
  sleep 1
end

Quando("clico no botão Entrar") do
  click_button("Entrar")
end

Então("na home deveremos ver a mensagem {string}") do |bem_vindo|
  expect(page).to have_content(bem_vindo)
end
