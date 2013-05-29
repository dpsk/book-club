class Vote < ActiveRecord::Base
  attr_accessible :book_id, :score, :user_id

  SCORES = [-10, -8, -5, -3, -1, 1, 3, 5, 8, 10]

  belongs_to :user
  belongs_to :book

  validates :book_id, presence: true
  validates :user_id, presence: true
  validates :score, presence: true

  before_create :check_uniqueness
  after_save :update_book_reputation

  def update_book_reputation
    book.update_attribute(:reputation, book.votes.map(&:score).inject(&:+))
  end

  def check_uniqueness
    errors.add :score, "You can not vote twice for the same book" if Vote.find_by_user_id_and_book_id(user_id, book_id)
  end
end
