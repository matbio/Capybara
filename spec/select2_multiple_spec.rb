describe "Quando eu uso o select 2 multiple", :multiple do
  before(:each) do
    visit "/apps/select2/multi.html"
  end

  def selecione(ator)
    find(".select2-selection--multiple").click
    find(".select2-search__field").set ator
    find(".select2-results__option").click
  end

  it "Então seleciono varias opções" do
    atores = ["Jim Carrey", "Adam Sandler", "Chris Rock"]
    atores.each do |a|
      selecione(a)
    end
    atores_selecionados = find(".ng-binding")
    expect(atores_selecionados).to have_content "Atores Selecionados: [1,2,3]"
  end

  it "E seleciono duas opções por busca por filtro" do
    atores = ["Ji", "ndler"]
    atores.each do |a|
      selecione(a)
    end
    atores_selecionados = find(".ng-binding")
    expect(atores_selecionados).to have_content "Atores Selecionados: [1,3]"
  end

  after(:each) do
    sleep 2
  end
end
