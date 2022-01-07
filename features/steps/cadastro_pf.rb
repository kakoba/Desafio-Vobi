require "faker"
require "cpf_faker"
require "securerandom"
Faker::Config.locale = "pt-BR"

Dado("acesso o menu Clientes e Fornecedores") do
  click_button "Clientes e Fornecedores"
end

Dado("e clico submenu Clientes") do
  click_link "Clientes"
end

Dado("verifico que estou na página {string}") do |clientes_texto|
  menu_clientes = find('h2[title="Meus Clientes"]')
  expect(menu_clientes.text).to eq clientes_texto
  find(:xpath, "//*[@id='root']/div/div[4]/div/div[1]/header/div[2]/div/div[2]/button").click
end

Quando("realizo o cadastro do cliente pessoa física") do
  # Cria um email aleatório para massa de dados
  @email_pj = Faker::Internet.email

  # Fechar Menu
  find("button.Collapse_left__1aK0Q").click

  # Digita o nome completo
  find('input[name="name"]').set Faker::Name.name
  # Digita a data de nascimento
  find('input[name="birthDate"]').set "11/12/1990"
  # desabilita e habilita opção do checkbox
  uncheck("isActive")
  check("isActive")
  # seleciona pessoa juridica e pessoa física
  find('input[value="pf"]').click
  # Garantir que ao selecionar o radio button PF, na página contém o campo CPF
  expect(page).to have_content "CPF"
  # preenche CPF no campo
  find("#doc").set Faker::CPF.pretty
  # preenche CPF no campo
  find('input[name="rg"]').set "23.576.309-3"
  # preenche Email no campo
  find('input[name="email"]').set @email_pj
  # preenche telefone no campo
  find('input[name="phone"]').set Faker::PhoneNumber.cell_phone
  # preenche CEP no campo
  find("#zipcode").set "59090-840"
  # preenche logradouro no campo
  find('input[name="street"]').set Faker::Address.street_name

  # preenche numero do logradouro no campo
  find('input[name="number"]').set rand(10...2000)

  # preenche complemento do logradouro no campo
  find('input[name="complement"]').set "150 A"

  # preenche complemento do logradouro no campo
  find('input[name="neighborhood"]').set "Ponta Negra"

  # preenche complemento do logradouro no campo
  find('input[name="city"]').set "Natal"

  # seleciona o estado no dropdown

  find("input[type=search]").set("RN - Rio Grande do Norte").send_keys(:return)

  # Preenche as observações
  find('div[data-placeholder="Observações"]').set("Graduanda Análise e Desenvolvimento de sistemas e uma QA em formação pela Faculdade Capital Federal, aplicando as melhores práticas de teste de software do mercado")
end

Então("devo visualizar o email do cliente na página de clientes") do
  expect(page).to have_content @email_pj
end
