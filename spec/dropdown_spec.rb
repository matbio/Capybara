describe "Quando eu uso o dropdown", :dropdown do
  it "Então eu seleciono uma opção" do
    visit "https://training-wheels-protocol.herokuapp.com/dropdown"
    select("Steve Rogers", from: "dropdown")
  end
  it "Então eu seleciono uma opção pela classe" do
    visit "https://training-wheels-protocol.herokuapp.com/dropdown"
    drop = find(".avenger-list")
    drop.find("option", text: "Loki").select_option
  end
  it "Então eu seleciono qualquer opção pela classe" do
    visit "https://training-wheels-protocol.herokuapp.com/dropdown"
    drop = find(".avenger-list")
    drop.all("option").sample.select_option
  end
end
