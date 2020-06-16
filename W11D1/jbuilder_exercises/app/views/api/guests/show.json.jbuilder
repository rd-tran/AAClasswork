json.partial! 'api/guests/guest', guest: @guest
json.gifts @gifts, partial: 'api/gifts/gift', as: :gift