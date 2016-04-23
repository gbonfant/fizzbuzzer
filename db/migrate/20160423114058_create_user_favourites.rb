class CreateUserFavourites < ActiveRecord::Migration
  def change
    create_table :user_favourites do |t|
      t.integer :number_value
      t.timestamps
    end
  end
end
