require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a author exists" do
  Author.all.destroy!
  request(resource(:authors), :method => "POST", 
    :params => { :author => { :id => nil }})
end

describe "resource(:authors)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:authors))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of authors" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a author exists" do
    before(:each) do
      @response = request(resource(:authors))
    end
    
    it "has a list of authors" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Author.all.destroy!
      @response = request(resource(:authors), :method => "POST", 
        :params => { :author => { :id => nil }})
    end
    
    it "redirects to resource(:authors)" do
      @response.should redirect_to(resource(Author.first), :message => {:notice => "author was successfully created"})
    end
    
  end
end

describe "resource(@author)" do 
  describe "a successful DELETE", :given => "a author exists" do
     before(:each) do
       @response = request(resource(Author.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:authors))
     end

   end
end

describe "resource(:authors, :new)" do
  before(:each) do
    @response = request(resource(:authors, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@author, :edit)", :given => "a author exists" do
  before(:each) do
    @response = request(resource(Author.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@author)", :given => "a author exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Author.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @author = Author.first
      @response = request(resource(@author), :method => "PUT", 
        :params => { :author => {:id => @author.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@author))
    end
  end
  
end

