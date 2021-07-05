describe "Quando eu realizo o login", :form do
  it "Então eu acesso com sucesso" do
    visit "/login"
    fill_in "username", with: "stark"
    fill_in "password", with: "jarvis!"

    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "Olá, Tony Stark. Você acessou a área logada!"
    #   expect(find("#flash").text).to have_content "Olá, Tony Stark. Você acessou a área logada!" = a de cima
  end
  it "Então eu não acesso com usuário incorreto" do
    visit "/login"
    fill_in "username", with: "errado"
    fill_in "password", with: "errado"

    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "O usuário informado não está cadastrado!"
  end
  it "Então eu não acesso com senha incorreta" do
    visit "/login"
    fill_in "username", with: "stark"
    fill_in "password", with: "errado"

    click_button "Login"
    expect(find("#flash").visible?).to be true
    expect(find("#flash").text).to include "Senha é invalida!"
  end
end
