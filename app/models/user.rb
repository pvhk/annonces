class User < ApplicationRecord

  attr_accessor :avatar_file
  has_secure_password
  has_secure_token :confirmation_token

  after_save :avatar_after_upload
  after_destroy :avatar_destroy
  before_save :avatar_before_upload

  validates :avatar_file, file: {ext:[:jpg, :png]}

  validates :username, format: {with: /\A[a-zA-Z0-9_]{2,20}\z/, message: 'ne doit contenir que des caractères alphanumérique ou des underscores'},
  uniqueness: {case_sensitive: false}
  validates :email, format:{with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'invalide'},
  uniqueness: {case_sensitive: false}


  def to_session
    {id: id}
  end

  def avatar_destroy
    dir = File.direname(avatar_path)
    FileUtils.rm_r(dir) if Dir.exist?(dir)

  end

  def avatar_url
    '/' + [
      self.class.name.downcase.pluralize,
      id.to_s,
      'avatar.jpg'
    ].join('/')
  end

  def avatar_before_upload
    if avatar_file.respond_to? :path
      self.avatar = true
    end
  end

  def avatar_path
    File.join(
    Rails.public_path,
    self.class.name.downcase.pluralize,
    id.to_s,
    'avatar.jpg'
    )
  end

  def avatar_after_upload
    path = avatar_path
    if avatar_file.respond_to? :path
      dir = File.dirname(path)
      FileUtils.mkdir_p(dir) unless Dir.exist?(dir)
      FileUtils.cp(avatar_file.path, path)
    end
  end
end
