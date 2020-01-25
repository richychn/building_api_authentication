json.extract! @menu, :id, :name
json.comments @menu.dishes do |dish|
  json.extract! dish, :id, :name
end