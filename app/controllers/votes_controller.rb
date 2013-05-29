class VotesController < ApplicationController
  inherit_resources
  nested_belongs_to :book
  before_filter :authenticate_user!

  def create
    create! {books_path}
  end

  def update
    update! {books_path}
  end

end
