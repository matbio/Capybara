describe "Quando eu uso a função enable/disable com Dynamic Control", :DC do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/dynamic_controls"
  end

  it "Então habilita o elemento" do
    click_button "Habilita"
    esta = page.has_field? "movie", disabled: false
    expect(esta).to be true
  end
  it "Então desabilita o elemento" do
    click_button "Habilita"
    click_button "Desabilita"
    esta = page.has_field? "movie", disabled: true
    expect(esta).to be true
  end
  after(:each) do
    sleep 2
  end
end
