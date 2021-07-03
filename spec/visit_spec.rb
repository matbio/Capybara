describe "Quando eu entrar na página", :visit do
  it "Então visualizo sua tela" do
    visit "https://training-wheels-protocol.herokuapp.com/"
    sleep 5
    expect(page.title).to eql("Training Wheels Protocol")
  end
end

# VISIT comando utilizado para acessar uma pagina web
# page.title acessa o titulo do menu
# sleep, mantem bota a execução do teste em eespera pelo tempo indicado
