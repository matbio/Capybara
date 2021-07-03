describe "Quando eu uso a função de upload", :upload do
  before(:each) do
    @arquivo = Dir.pwd + "/fixtures/upload.txt"
    @imagem = Dir.pwd + "/fixtures/upload.jpg"
    visit "https://training-wheels-protocol.herokuapp.com/upload"
  end

  it "Então eu subo um arquivo de texto (.txt)" do
    attach_file("file-upload", @arquivo)
    click_button "Upload"
    div_arq = find("#uploaded-file")
    expect(div_arq.text).to include "upload.txt"
  end

  it "Então eu subo uma imagem(.jpg)" do
    attach_file("file-upload", @imagem)
    click_button "Upload"
    div_img = find("#new-image")
    expect(div_img[:src]).to include "upload.jpg"
  end

  after(:each) do
    sleep 2
  end
end
