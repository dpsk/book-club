class Book < ActiveRecord::Base
  attr_accessible :cover_url, :genre, :name, :notes, :user_id
end
