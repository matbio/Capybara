describe "Quando eu clico no botão de alerta", :alerta do
  before(:each) do
    visit "/javascript_alerts"
  end

  it "Então aparece uma mensagem de alerta" do
    click_button "Alerta"
    alerta = page.driver.browser.switch_to.alert.text
    expect(alerta).to include "Isto é uma mensagem de alerta"
  end
  it "E o Result avisa que apertou o alerta" do
    click_button "Alerta"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "Você ativou um alerta JS"
  end
  after(:each) do
    sleep 2
  end
end

describe "Quando eu clico no botão de Comfirma", :comfirma do
  before(:each) do
    visit "/javascript_alerts"
  end

  it "Então aparece uma mensagem de Eai comfirma?" do
    click_button "Confirma"
    confirma = page.driver.browser.switch_to.alert.text
    expect(confirma).to include "E ai confirma?"
  end
  it "E eu confirmo a mensagem" do
    click_button "Confirma"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "Mensagem confirmada"
  end
  it "E eu clico em confirma novamente e cancelo" do
    click_button "Confirma"
    page.driver.browser.switch_to.alert.dismiss
    expect(page).to have_content "Mensagem não confirmada"
  end
  after(:each) do
    sleep 2
  end
end

describe "Quando eu clico no botão de prompt", :prompt do
  before(:each) do
    visit "/javascript_alerts"
  end

  it "Então aparece uma mensagem de Qual é seu Nome?" do
    click_button "Prompt"
    prompt = page.driver.browser.switch_to.alert.text
    expect(prompt).to include "Qual o seu Nome?"
  end
  it "E eu preencho meu nome e confirmo" do
    accept_prompt(with: "Matheus") do
      click_button "Prompt"
    end
    expect(page).to have_content "Olá, Matheus"
  end
  it "E eu clico novamente em promt, mas eu cancelo" do
    dismiss_prompt do
      click_button "Prompt"
    end
    expect(page).to have_content "Olá, null"
  end
  after(:each) do
    sleep 2
  end
end
