require './lib/helpers/markdowner.rb'

class Article < ActiveRecord::Base
  include Markdowner
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: {minimum: 5}
  validates :content_markdown, presence: true, length: {minimum: 100}
  validates :excerpt, presence: true, length: {minimum: 100, maximum: 500}

  before_create :set_published_date, :convert_markdown
  before_update :set_published_date, :convert_markdown

  def set_published_date
    self.published && self.published_on.nil? ? self.published_on = Time.now : nil
  end

  def convert_markdown
    self.content_html = markdown_to_html(self.content_markdown)
  end
end
