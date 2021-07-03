describe "Quando eu sobre o mouse sobre", :hover do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/hovers"
  end

  it "Então o hover da figura do blade" do
    fig = find("img[alt=Blade]")
    fig.hover
    expect(page).to have_content "Nome: Blade"
  end

  it "Então o hover da figura do Pantera Negra" do
    # quando tiver char especiais ou divididos por espaço deve ser colocado sobre entre '' no atributo alt
    fig = find("img[alt='Pantera Negra']")
    fig.hover
    expect(page).to have_content "Nome: Pantera Negra"
  end

  it "Então o hover da figura do Homem Aranha" do
    # quando tiver char especiais ou divididos por espaço deve ser colocado sobre entre '' no atributo alt
    fig = find("img[alt='Homem Aranha']")
    fig.hover
    expect(page).to have_content "Nome: Homem Aranha"
  end

  after(:each) do
    sleep 2
  end
end

# EXEMPLOS TAMBÉM PARA UTILIZAÇÃO
# Para usar o começo da palavra    fig = find("img[alt^=Homem]")
# Para usar o final da palavra    fig = find("img[alt$=Aranha]")
# Para usar a que contenha o trecho    fig = find("img[alt*=anha]")
