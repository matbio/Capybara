describe "Quando usa a função de teclado em tela", :teclado do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/key_presses"
  end

  it "Então quando eu pressionar uma tecla" do
    find("#campo-id").send_keys :space
    expect(page).to have_content "You entered: SPACE"
  end

  it "E quando eu pressionar varias teclas de simbolos" do
    # %I ele refere que a array a seguir contêm simbolos
    keys = %i[tab space control shift alt]

    keys.each do |t|
      find("#campo-id").send_keys t
      expect(page).to have_content "You entered: #{t.to_s.upcase}"
    end
  end

  it "E quando eu pressionar varias teclas letras" do
    # %w ele refere que a array a seguir contêm simbolos
    keys = %w[A c D f G x y T]

    keys.each do |w|
      find("#campo-id").send_keys w
      expect(page).to have_content "You entered: #{w.to_s.upcase}"
    end
  end

  after(:each) do
    sleep 2
  end
end
