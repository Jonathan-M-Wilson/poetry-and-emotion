class SearchController < ApplicationController
  def index
    @author = SearchResultsFacade.new.get_poems(params[:author])
  end
end
