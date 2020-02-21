class CreateItemsWishlistsJoinTable < ActiveRecord::Migration[6.0]
  def change
	  create_join_table :items, :wishlists do |t|
		  t.index :item_id
		  t.index :wishlist_id
	  end
  end
end
