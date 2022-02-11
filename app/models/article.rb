class Article < ApplicationRecord


 validates :title, presence: true
  validates :content, presence: true

  # I18n.t('title') #=> 'Hello World'
  # I18n.t('text') #
  belongs_to :user

end
