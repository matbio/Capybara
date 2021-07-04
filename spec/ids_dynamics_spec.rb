describe "Quando eu realizo o login com IDs dinâmicos", :ids_dynamics do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/access"
  end

  # $= termina com
  # ^= começa com
  # *= contem

  it "Então eu acesso com sucesso" do
    find('input[id$="UsernameInput"]').set "stark"
    find('input[id^="PasswordInput"]').set "jarvis!"
    find('a[id*="GetStartedButton"]').click
    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end

  after(:each) do
    sleep 2
  end
end
