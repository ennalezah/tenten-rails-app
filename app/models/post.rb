class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  before_save :make_titlecase, :make_downcase

  private

  def make_titlecase
    self.title = title.titlecase
  end

  def make_downcase
    self.url = url.downcase
  end
end
