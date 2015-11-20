class Post < ActiveRecord::Base

  extend FriendlyId
  belongs_to :user
  has_many :comments
  friendly_id :post_title, use: :scoped, scope: :user


  # friendly_id :post_title, use: :slugged

  has_attached_file :post_img, styles: { medium: '700x300>'}, default_url: 'http://placehold.it/700x300', :storage => :s3 , :bucket => 'bloglyusercontent' , :s3_host_name => 's3-us-west-1.amazonaws.com'
  validates_attachment_content_type :post_img, content_type: /\Aimage\/.*\Z/

  validates :post_title, presence: true , uniqueness: { scope: :user_id , case_sensitive: false}

  validates :post_text, presence: true




end
