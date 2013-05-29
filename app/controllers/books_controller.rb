class BooksController < ApplicationController
  inherit_resources
  before_filter :authenticate_user!, except: :index
end
