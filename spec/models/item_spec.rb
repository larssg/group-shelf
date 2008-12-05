require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Item do
  context "with reviews" do
    before do
      @item = Factory(:item)
    end
    
    it "should calculate stars from 1 review" do
      Factory(:review, :item => @item, :score => 3)
      @item.stars.should == 3
    end

    it "should calculate stars from 2 reviews" do
      [1, 3].each do |score|
        Factory(:review, :item => @item, :score => score)
      end
      @item.stars.should == 2
    end
    
    it "should round stars to nearest .5" do
      [1, 3, 4].each do |score|
        Factory(:review, :item => @item, :score => score)
      end
      
      # average of 1, 3 and 4 = 2.666
      @item.stars.should == 2.5
    end
  end
end