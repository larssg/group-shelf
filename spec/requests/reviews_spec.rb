require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a review exists" do
  Review.all.destroy!
  request(resource(:reviews), :method => "POST", 
    :params => { :review => { :id => nil }})
end

describe "resource(:reviews)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:reviews))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of reviews" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a review exists" do
    before(:each) do
      @response = request(resource(:reviews))
    end
    
    it "has a list of reviews" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Review.all.destroy!
      @response = request(resource(:reviews), :method => "POST", 
        :params => { :review => { :id => nil }})
    end
    
    it "redirects to resource(:reviews)" do
      @response.should redirect_to(resource(Review.first), :message => {:notice => "review was successfully created"})
    end
    
  end
end

describe "resource(@review)" do 
  describe "a successful DELETE", :given => "a review exists" do
     before(:each) do
       @response = request(resource(Review.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:reviews))
     end

   end
end

describe "resource(:reviews, :new)" do
  before(:each) do
    @response = request(resource(:reviews, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@review, :edit)", :given => "a review exists" do
  before(:each) do
    @response = request(resource(Review.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@review)", :given => "a review exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Review.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @review = Review.first
      @response = request(resource(@review), :method => "PUT", 
        :params => { :review => {:id => @review.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@review))
    end
  end
  
end

