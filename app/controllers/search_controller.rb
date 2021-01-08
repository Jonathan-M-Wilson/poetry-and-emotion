class SearchController < ApplicationController
  def index
    @author = SearchResultsFacade.get_poems(params[:author])
  end
end
