require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/front" do
  before(:each) do
    @response = request("/front")
  end
end