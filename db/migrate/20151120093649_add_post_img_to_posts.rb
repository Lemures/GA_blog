class AddPostImgToPosts < ActiveRecord::Migration
  def up
    add_attachment :posts, :post_img
  end

  def down
    remove_attachment :posts, :post_img
  end
end
