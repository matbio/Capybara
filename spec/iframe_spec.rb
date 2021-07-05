describe "Quando eu usar o iframe bom na minha página", :iframebom do
  before(:each) do
    visit "/nice_iframe"
  end

  it "Então vou adcionar um item ao carrinho " do
    within_frame("burgerId") do
      fritas = find(".menu-item-info-box", text: "BATATAS FRITAS")
      fritas.find("a").click
      expect(find("#cart")).to have_content "5,50"
    end
  end
  it "E quando o carrinho esta vazio" do
    within_frame("burgerId") do
      expect(find("#cart")).to have_content "Seu carrinho está vazio!"
    end
  end

  after(:each) do
    sleep 2
  end
end

describe "Quando eu usar o iframe ruim na minha página", :iframeruim do
  before(:each) do
    visit "/bad_iframe"
  end

  it "Então vou adcionar um item ao carrinho " do
    script = '$(".box-iframe").attr("id", "tempId");'
    page.execute_script(script)

    within_frame("tempId") do
      sorvete = find(".menu-item-info-box-content", text: "MEGA SUNDAY")
      sorvete.find("a").click
      expect(find("#cart")).to have_content "21,50"
    end
  end
  it "E quando o carrinho esta vazio" do
    script = '$(".box-iframe").attr("id", "tempId");'
    page.execute_script(script)

    within_frame("tempId") do
      expect(find("#cart")).to have_content "Seu carrinho está vazio!"
    end
  end

  after(:each) do
    sleep 2
  end
end
