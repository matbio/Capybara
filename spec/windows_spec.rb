describe "Quando eu clicar no link que alterna as janelas", :janelas do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/windows"
  end

  it "Então eu acesso uma nova janela" do
    #Avisando o capybara que quando eu executar esse comando ele está em uma nova janela
    janela = window_opened_by { click_link "Clique aqui" }
    within_window -> { page.title == "Nova Janela" } do
      expect(page).to have_content 'Aqui temos uma nova janela \o/'
      janela.close
      expect(janela.closed?).to be true
    end
  end

  after(:each) do
    sleep 2
  end
end
