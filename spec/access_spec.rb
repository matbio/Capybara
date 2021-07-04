describe "Quando eu realizo o login com um campos de mesmo nome", :accesslogin do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/access"
  end
  # Como nessa página temos dois formularios que apresentão o mesmos campos de input username e password, o capybara gera um erro de ambiguidade.
  # para solucionar esse erro podemos usar o escopo, indicando o elemento pai em que esses campos são unicos. exemplo abaixo:
  def insere_dados_escopo(user, pass)
    form_login = find("#login")
    form_login.find('input[name="username"]').set user
    form_login.find('input[name="password"]').set pass
    form_login.click_button "Entrar"
  end

  it "Então eu acesso com sucesso dentro de um escopo" do
    insere_dados_escopo("stark", "jarvis!")
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "Olá, Tony Stark. Você acessou a área logada!"
  end
  it "E eu não acesso com usuário incorreto dentro de um escopo" do
    insere_dados_escopo("errado", "errado")
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "O usuário informado não está cadastrado!"
  end
  it "E eu não acesso com senha incorreta de um escopo" do
    insere_dados_escopo("stark", "errado")
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "Senha é invalida!"
  end
  it "E eu não acesso sem preencher nada de um escopo" do
    insere_dados_escopo("", "")
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "O usuário informado não está cadastrado!"
  end
  after(:each) do
    sleep 2
  end
end

# Como nessa página temos dois formularios que apresentão o mesmos campos de input username e password, o capybara gera um erro de ambiguidade.
# para solucionar esse erro podemos usar o escopo, agora outra maneira de usar o escopo. exemplo abaixo:
describe "Quando eu realizo o cadastro com um campos de mesmo nome", :accesssignup do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/access"
  end

  def insere_dados_escopo(user, pass)
    within("#signup") do
      find('input[name="username"]').set user
      find('input[name="password"]').set pass
      click_link "Criar Conta"
    end
  end

  it "Então envio os dados com sucesso dentro um escopo" do
    insere_dados_escopo("steve", "buck!")
    expect(find("#result").text).to include "Dados enviados. Aguarde aprovação do seu cadastro!"
  end
  it "E não envio os dados sem usuário dentro um escopo" do
    insere_dados_escopo("", "buck!")
    expect(find("#error").text).to include "Ops. Faltou informar o usuário."
  end
  it "E não envio os dados sem senha dentro um escopo" do
    insere_dados_escopo("steve", "")
    expect(find("#error").text).to include "Ops. Cadê senha?"
  end
  it "E não envio os dados sem preencher nada dentro um escopo" do
    insere_dados_escopo("", "")
    expect(find("#error").text).to include "Ops. Faltou informar o usuário."
  end
  after(:each) do
    sleep 2
  end
end
