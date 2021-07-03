describe "Quando eu uso uma checkbox", :checkbox do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/checkboxes"
  end
  it "Então marco um valor" do
    check("thor")
  end
  it "E desmarco um valor" do
    uncheck("antman")
  end
  it "E marco outro valor sem name ou id" do
    find("input[value=cap]").set(true)
  end
  it "E desmarco outro valor sem name ou id" do
    find("input[value=guardians]").set(false)
  end
  after(:each) do
    sleep 1
  end
end
