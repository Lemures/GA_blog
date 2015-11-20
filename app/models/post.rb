class Post < ActiveRecord::Base

  extend FriendlyId
  belongs_to :user
  has_many :comments
  friendly_id :post_title, use: :scoped, scope: :user

  # friendly_id :post_title, use: :slugged

  #paperclip
  has_attached_file :post_img, styles: { medium: '700x300>'}, default_url: 'http://placehold.it/700x300', :storage => :s3 , :bucket => 'bloglyusercontent' , :s3_host_name => 's3-us-west-1.amazonaws.com'
  validates_attachment_content_type :post_img, content_type: /\Aimage\/.*\Z/

  #Validation
  validate :post_title_valid, :post_text_valid

  # validates :post_title, presence: true , uniqueness: { scope: :user_id , case_sensitive: false }
  # validates :post_text, presence: true

  def post_title_valid

    unless validates :post_title, presence: true, uniqueness: {scope: :user_id, case_sensitive: false}

      errors.add(:post_title, 'Can not reuse the same title or be empty')

    end


  end

  def post_text_valid

    unless  validates :post_text, presence: true

      errors.add(:post_text, "This can't be blank, share your thoughts with us :)")

    end
  end



end
