describe "Quando eu realizo o login com um campo dinâmico", :logindynamic do
  before(:each) do
    visit "/login2"
  end
  it "Então eu acesso com sucesso" do
    fill_in "username", with: "stark"
    fill_in "password", with: "jarvis!"
    login = find("#login")
    case login.text
    when /Dia/
      fill_in "bday", with: "29"
      #find("#day").set "29"
    when /Mês/
      fill_in "bday", with: "05"
      #find("#month").set "05"
    when /Ano/
      #find("#year").set "1970"
      fill_in "bday", with: "1970"
    end
    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "Olá, Tony Stark. Você acessou a área logada!"
    #expect(find("#flash").text).to have_content "Olá, Tony Stark. Você acessou a área logada!"
  end
  it "E eu não acesso com usuário incorreto" do
    fill_in "username", with: "errado"
    fill_in "password", with: "errado"
    fill_in "bday", with: "12"

    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "O usuário informado não está cadastrado!"
  end
  it "E eu não acesso com senha incorreta" do
    fill_in "username", with: "stark"
    fill_in "password", with: "errado"
    fill_in "bday", with: "12"

    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "Senha é invalida!"
  end
  it "E eu não acesso com a data de nascimento incorreta" do
    fill_in "username", with: "stark"
    fill_in "password", with: "jarvis!"
    fill_in "bday", with: "12"

    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "Data de nascimento incorreta!"
  end
  it "E eu não acesso sem preencher nada" do
    fill_in "username", with: ""
    fill_in "password", with: ""
    fill_in "bday", with: ""

    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "O usuário informado não está cadastrado!"
  end
  after(:each) do
    sleep 2
  end
end
