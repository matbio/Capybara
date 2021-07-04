describe "Quando eu tenho uma tabela", :grid do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/tables"
  end

  it "Então eu consigo visualizar um elemento" do
    atores = all("table tbody tr")
    ator = atores.detect { |a| a.text.include?("Chadwick Boseman") }

    expect(ator).to have_content "700.000"
  end

  it "E eu consigo visualizar um elemento por campo chave" do
    ator = find("table tbody tr", text: "@prattprattpratt")
    expect(ator).to have_content "Senhor das Estrelas"
  end

  it "E eu consigo visualizar um elemento por campo chave e confirmar sua posição" do
    ator = find("table tbody tr", text: "@prattprattpratt")
    movie = ator.all("td")[1].text
    expect(movie).to include "Senhor das Estrelas"
  end

  it "E eu consigo selecionar um elemento para remoção" do
    ator = find("table tbody tr", text: "@prattprattpratt")
    ator.find("a", text: "delete").click

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to include "Chris Pratt foi selecionado para remoção!"
  end

  it "E eu consigo selecionar um elemento para edição" do
    ator = find("table tbody tr", text: "@prattprattpratt")
    ator.find("a", text: "edit").click

    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to include "Chris Pratt foi selecionado para edição!"
  end

  after(:each) do
    sleep 2
  end
end
