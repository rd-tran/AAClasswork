json.extract! @party, :name, :location
json.guests @guests do |guest|
  json.extract! guest, :name, :age
  json.gifts guest.gifts, :title, :description
end