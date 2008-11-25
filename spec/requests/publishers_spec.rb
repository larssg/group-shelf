require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a publisher exists" do
  Publisher.all.destroy!
  request(resource(:publishers), :method => "POST", 
    :params => { :publisher => { :id => nil }})
end

describe "resource(:publishers)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:publishers))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of publishers" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a publisher exists" do
    before(:each) do
      @response = request(resource(:publishers))
    end
    
    it "has a list of publishers" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Publisher.all.destroy!
      @response = request(resource(:publishers), :method => "POST", 
        :params => { :publisher => { :id => nil }})
    end
    
    it "redirects to resource(:publishers)" do
      @response.should redirect_to(resource(Publisher.first), :message => {:notice => "publisher was successfully created"})
    end
    
  end
end

describe "resource(@publisher)" do 
  describe "a successful DELETE", :given => "a publisher exists" do
     before(:each) do
       @response = request(resource(Publisher.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:publishers))
     end

   end
end

describe "resource(:publishers, :new)" do
  before(:each) do
    @response = request(resource(:publishers, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@publisher, :edit)", :given => "a publisher exists" do
  before(:each) do
    @response = request(resource(Publisher.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@publisher)", :given => "a publisher exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Publisher.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @publisher = Publisher.first
      @response = request(resource(@publisher), :method => "PUT", 
        :params => { :publisher => {:id => @publisher.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@publisher))
    end
  end
  
end

