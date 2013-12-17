class Post < ActiveRecord::Base
  #validation
  validates :title, presence: true
  validates :description, presence: true

  attr_accessible :title, :description, :photo, :remote_image_url, :tag_list, :upvoters, :downvoters, :artist, :commision, :medium, :address
  mount_uploader :photo, ImageUploader
  geocoded_by :address
  after_validation :geocode

  acts_as_taggable

  #relationships
  belongs_to :user
  has_many :scores
  has_many :stars

  #voting
  def deserialize(post)
    @post = post
    upvoters = @post.upvoters[1..-2].split(',').collect! {|n| n.to_i}
    downvoters = @post.downvoters[1..-2].split(',').collect! {|n| n.to_i}
    return upvoters, downvoters
  end

  
end