describe "Quando eu uso a função de drag e drop", :dragdrop do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/drag_and_drop"
  end

  it "Então eu arrasto o elemento da direita para a esquerda" do
    esquerda = find(".team-stark .column")
    direita = find(".team-cap .column")

    elemento = find("img[alt='Homem Aranha']")

    elemento.drag_to esquerda
    expect(esquerda).to have_css("img[alt='Homem Aranha")
    expect(direita).not_to have_css("img[alt='Homem Aranha")
  end

  after(:each) do
    sleep 2
  end
end
