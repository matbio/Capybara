describe "Quando eu uso o select 2 single", :single do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/apps/select2/single.html"
  end

  it "Então eu seleciono uma opção" do
    find(".select2-selection--single").click
    find(".select2-results__option", text: "Jim Carrey").click
    ator = find(".ng-binding")
    expect(ator).to have_content "Ator selecionado: 3"
  end
  it "E clico no botão Liga/Desliga" do
    find(".select2-selection--single").click
    find(".select2-results__option", text: "Jim Carrey").click
    click_button "Liga/Desliga"
    ator = find(".select2-selection__rendered")
    expect(ator).to have_content "Jim Carrey"
  end

  it "E Busca e seleciona a opção filtrada" do
    find(".select2-selection--single").click
    find(".select2-search__field").set "Ow"
    find(".select2-results__option").click
    click_button "Liga/Desliga"
    ator = find(".ng-binding")
    expect(ator).to have_content "Ator selecionado: 5"
  end
  after(:each) do
    sleep 2
  end
end
