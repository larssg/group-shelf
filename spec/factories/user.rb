Factory.sequence :login do |n|
  "user#{n}"
end

Factory.define :user do |u|
  u.login Factory.next(:login)
end