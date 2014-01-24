class Book < ActiveRecord::Base
  acts_as_paranoid

  validates :title, presence: true, length: {maximum: 200}
  validates :author, presence: true, length: {maximum: 200}
end
