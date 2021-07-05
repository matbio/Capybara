describe "Quando eu realizo o login (Com screenshot)", :screenshot do
  before(:each) do
    visit "/login"
  end
  it "Então eu acesso com sucesso screenshot" do
    fill_in "username", with: "stark"
    fill_in "password", with: "jarvis!"

    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "Olá, Tony Stark. Você acessou a área logada!"

    #expect(find("#flash")).to have_content "Olá, Tony Stark. Você acessou a área logada!" = a de cima

    # Tira o screenshot após fim teste, executando o comando abaixo:
    # page.save_screenshot("logs/login_sucesso.png")

  end
  it "E eu não acesso com usuário incorreto screenshot" do
    fill_in "username", with: "errado"
    fill_in "password", with: "errado"

    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "O usuário informado não está cadastrado!"

    # Tira o screenshot após fim teste, executando o comando abaixo:
    #page.save_screenshot("logs/login_erro_user.png")
  end
  it "E eu não acesso com senha incorreta screenshot" do
    fill_in "username", with: "stark"
    fill_in "password", with: "errado"

    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "Senha é invalida!"

    # Tira o screenshot após fim teste, executando o comando abaixo:
    #page.save_screenshot("logs/login_erro_pass.png")
  end
  #after(:each) do |e|
  #  nome = e.description.gsub(/[^A-Za-z0-9 ]/, "").tr(" ", "_")
  #  page.save_screenshot("logs/" + nome + ".png")
  #end
end
