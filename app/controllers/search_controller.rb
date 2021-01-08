class SearchController < ApplicationController
  def index
    @results = SearchResultsFacade.get_poems(params[:author])
  end
end
