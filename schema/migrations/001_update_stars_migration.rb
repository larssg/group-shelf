migration 1, :update_stars  do
  up do
    Item.all.each do |item|
      item.update_review_cache!
    end
  end

  down do
  end
end
