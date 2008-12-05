Factory.define :review do |r|
  r.body 'This is a review'
  r.score 3
  r.association :user
  r.association :item
end