class InsertInitialRooms < ActiveRecord::Migration[6.0]
  def change
    rooms = ["キャンプ", "クロージング", "FG", "フィッシング", "店舗情報"]
    rooms.each do |room|
      Room.create(name: room)
    end
  end
end
