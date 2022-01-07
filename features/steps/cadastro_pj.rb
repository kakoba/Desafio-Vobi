require "faker"
require "cpf_faker"
require "securerandom"
Faker::Config.locale = "pt-BR"

Dado("realizo o cadastro do cliente pessoa jurídica") do
  # Cria um email aleatório para massa de dados
  email_pf = Faker::Internet.email

  # Fechar Menu
  find("button.Collapse_left__1aK0Q").click

  # Digita o nome completo
  find('input[name="name"]').set Faker::Company.name
  # Digita a data de nascimento
  find('input[name="birthDate"]').set "12/02/1988"
  # desabilita e habilita opção do checkbox
  uncheck("isActive")
  check("isActive")
  # seleciona pessoa juridica e pessoa jurídica
  find('input[value="pj"]').click
  # Garantir que ao selecionar o radio button PF, na página contém o campo CNPJ
  expect(page).to have_content "CNPJ"
  # preenche CPF no campo
  find("#doc").set Faker::CNPJ.pretty
  # preenche CPF no campo
  find('input[name="rg"]').set "23.576.309-3"
  # preenche Email no campo
  find('input[name="email"]').set email_pf
  # preenche telefone no campo
  find('input[name="phone"]').set Faker::PhoneNumber.cell_phone
  # preenche CEP no campo
  find("#zipcode").set "88385-000"
  # preenche logradouro no campo
  find('input[name="street"]').set "Rod. Beto Carrero World"

  # preenche numero do logradouro no campo
  find('input[name="number"]').set rand(10...2000)

  # preenche complemento do logradouro no campo
  find('input[name="complement"]').set rand(10...2000)

  # preenche complemento do logradouro no campo
  find('input[name="neighborhood"]').set "Penha "

  # preenche complemento do logradouro no campo
  find('input[name="city"]').set "Penha"

  # seleciona o estado no dropdown

  find("input[type=search]").set("SC - Santa Catarina").send_keys(:return)

  # Preenche as observações
  find('div[data-placeholder="Observações"]').set("Beto Carrero World - O maior parque temático da América Latina! Mais de 100 incríveis atrações para toda a família!")
end

Quando("clico no botão salvar") do
  click_button("Salvar")
end
