class SeriesCollectionDecorator < Draper::CollectionDecorator
  def decorator_class
    SeriesDecorator
  end

  def oval
    select{|item| item.oval?}
  end

  def road
    select{|item| item.road?}
  end
end
