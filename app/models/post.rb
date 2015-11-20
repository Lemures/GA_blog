class Post < ActiveRecord::Base
  has_attached_file :post_image, styles: { medium: '700x300>'}, default_url: '/images/:style/missing.png', :storage => :s3 , :bucket => 'bloglyusercontent' , :s3_host_name => 's3-us-west-1.amazonaws.com'
  validates_attachment_content_type :post_image, content_type: /\Aimage\/.*\Z/

  belongs_to :user

  has_many :comments

end
