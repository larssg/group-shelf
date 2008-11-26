class Reviews < Application
  def create(review)
    item = Item.first(:id => review[:item_id])
    @review = Review.new(review.merge(:user => session.user))
    if @review.save
      redirect url(:item, item), :message => {:notice => "Your review of \"#{item.title}\" has been added"}
    else
      message[:error] = "Review failed to be created"
      redirect url(:item, item), :message => {:notice => "Your review of \"#{item.title}\" has encountered an error: #{@review.errors}"}
    end
  end
end # Reviews