require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

describe "/books" do
  before(:each) do
    @response = request("/books")
  end
end