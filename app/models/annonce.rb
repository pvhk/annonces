class Annonce < ApplicationRecord
    belongs_to :user
    belongs_to :category
    belongs_to :game

    has_many :options
    accepts_nested_attributes_for :options

    attr_accessor :picture_file
    validate :validation_method

    after_save :picture_after_upload
    before_destroy :picture_destroy
    before_save :picture_before_upload

    validates :picture_file, file: {ext: [:jpg, :png], allow_blank: true}

    def validation_method
        if name.length < 4
            errors.add(:name, :inferior_4, { message:'Il faut que la longeur du nom soit superieur à 4 !'})
        end
        if description.length < 10
            errors.add(:description, :inferior_10, { message:'Il faut que la longeur de la description soit superieur à 10 !'})
        end
    end

  def picture_url
    '/' + [
      self.class.name.downcase.pluralize,
      id.to_s,
      'picture.jpg'
    ].join('/')
  end

  def picture_before_upload
    if picture_file.respond_to? :path
      self.picture = true
    end
  end

  def picture_path
    File.join(
    Rails.public_path,
    self.class.name.downcase.pluralize,
    id.to_s,
    'picture.jpg'
    )
  end

  def picture_after_upload
    path = picture_path
    if picture_file.respond_to? :path
      dir = File.dirname(path)
      FileUtils.mkdir_p(dir) unless Dir.exist?(dir)
      FileUtils.cp(picture_file.path, path)
    end
  end

  def picture_destroy
    picture_path.delete
  end
end
