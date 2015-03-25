class CreateAvatar< ActiveRecord::Migration
 def self.up
    change_table :users do |t|
      t.attachment :avatar
    end
    change_table :ingredients do |t|
      t.attachment :image
    end
    change_table :recipes do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :users, :avatar
    drop_attached_file :ingredients, :image
    drop_attached_file :recipes, :image
  end
end
