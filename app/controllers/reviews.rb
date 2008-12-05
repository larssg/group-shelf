class Reviews < Application
  def create(review)
    @review = Review.new(review.merge(:user => session.user))
    if @review.save
      redirect url(:item, review[:item_id]), :message => {:notice => "Your review has been added"}
    else
      redirect url(:item, review[:item_id]), :message => {:notice => "Your review has encountered an error: #{@review.errors}"}
    end
  end
end # Reviews