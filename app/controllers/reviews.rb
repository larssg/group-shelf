class Reviews < Application
  def create(review)
    book = Book.first(:id => review[:book_id])
    @review = Review.new(review.merge(:user => session.user))
    if @review.save
      redirect resource(book), :message => {:notice => "Your review of \"#{book.title}\" has been added"}
    else
      message[:error] = "Review failed to be created"
      redirect resource(book), :message => {:notice => "Your review of \"#{book.title}\" has encountered an error: #{@review.errors}"}
    end
  end
end # Reviews