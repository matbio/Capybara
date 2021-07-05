describe "Quando eu uso uma radio", :radio do
  before(:each) do
    visit "/radios"
  end

  it "Então marco um valor com id" do
    choose("cap")
  end

  it "Então marco um valor sem id" do
    find("input[value=iron-man]").click
    #find("input[value=iron-man]").set(true)
  end

  it "Então desmarco um valor sem id e marco outro sem id" do
    find("input[value=iron-man]").click
    sleep 1
    find("input[value=guardians]").click
    #find("input[value=iron-man]").set(true)
    #sleep 1
    #find("input[value=guardians]").set(true)
  end

  after(:each) do
    sleep 1
  end
end
