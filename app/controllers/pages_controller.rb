class PagesController < ApplicationController
  def about
 
@title = "about"

  end
  def search
  @title = "search"  end

  def home
 @title = params[:q]
	if params[:q] 
		require 'rubygems'
		require 'wikicloth'
		require 'media_wiki'
		mw = MediaWiki::Gateway.new('http://en.wikipedia.org/w/api.php/')
	#	wiki = WikiCloth::Parser.new({:data => mw.get(params[:q])}) 
		@options = [:limit =>50]
		wiki =  mw.search(params[:q],"main", 5) 
    
		@content=wiki

	end
if params[:c] 
		require 'rubygems'
		require 'calc'
		@output = Calc.evaluate(params[:c]) 
	end
end


  def contact
  @title = "contact"
  end
end
