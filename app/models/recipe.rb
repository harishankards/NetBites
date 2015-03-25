class Recipe < ActiveRecord::Base
    searchkick autocomplete: ['name']
    has_and_belongs_to_many :ingredients
    
    has_many :comments

    belongs_to :user

    acts_as_taggable_on :ingredients
    has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
