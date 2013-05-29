require "spec_helper"

describe VotesController do
  describe "routing" do

    it "routes to #new" do
      get("/books/1/votes/new").should route_to("votes#new", book_id: "1")
    end
    it "routes to #edit" do
      get("/books/1/votes/1/edit").should route_to("votes#edit", id: "1", book_id: "1")
    end

    it "routes to #create" do
      post("books/1/votes").should route_to("votes#create", book_id: "1")
    end

    it "routes to #update" do
      put("books/1/votes/1").should route_to("votes#update", id: "1", book_id: "1")
    end

  end
end
