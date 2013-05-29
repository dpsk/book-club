class Book < ActiveRecord::Base
  attr_accessible :cover_url, :author, :genre, :name, :notes, :user_id, :featured

  belongs_to :user
  has_many :votes

  validates :name, presence: true, uniqueness: true
  validates :cover_url, :format => URI::regexp(%w(http https))
  validates :author, presence: true
  validates :user_id, presence: true

  after_save :one_featured_book

  def one_featured_book
    if featured
      featured_books = Book.where(featured: true).reject{|b| b == self}
      featured_books.each { |b| b.update_attribute(:featured, false) }
    end
  end

  def set_as_featured!
    assign_attributes(featured: true)
    self.save
  end

  def self.book_of_the_day
    where(featured: true).first
  end

  def added_by user
    user_id == user.id
  end

  def voted_by user
    votes.map(&:user_id).include? user.id
  end

  def vote_by user
    votes.where(user_id: user.id).first
  end

end
