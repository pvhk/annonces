class User < ApplicationRecord

  attr_accessor :avatar_file
  has_secure_password
  has_secure_token :confirmation_token

  validates :username, format: {with: /\A[a-zA-Z0-9_]{2,20}\z/, message: 'ne doit contenir que des caractères alphanumérique ou des underscores'},
  uniqueness: {case_sensitive: false}
  validates :email, format:{with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'invalide'},
  uniqueness: {case_sensitive: false}
  validates :avatar_file, file: {ext:[:jpg, :png]}

  def to_session
    {id: id}
  end
end
