require "capybara"
require "capybara/rspec"
require "selenium-webdriver"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  # Configurar para que as funções , metodos e etc do capybara sejam entendidos pelo rspec
  config.include Capybara::DSL
  # Para configurar um redicionamento de tela que melhor atenda os teste:
  config.before(:example) do
    page.current_window.resize_to(1200, 800)
  end
  config.after(:example) do |e|
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, "").tr(" ", "_")
    #Ao acrescentar o if e.exception será validado se oxiste uma exceção de falha e se existir ele tira um screenshot
    page.save_screenshot("logs/" + nome + ".png") if e.exception
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  #config.default_driver = :selenium_chrome_headless #(executa sem levantar o navegador)
  #config.default_driver = :selenium
  #Para não obrigar a um tempo de sleep fixo nos testes, podemos configurar um periodo maximo de espera para que o capybara aguarde o elemento
  config.default_max_wait_time = 10

  #Para estabelecer uma rota padrão para todos os projetos de teste e so indicar o final do caminho, incluir código:
  config.app_host = "https://training-wheels-protocol.herokuapp.com"
end
