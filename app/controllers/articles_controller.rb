class ArticlesController < ApplicationController

    http_basic_authenticate_with name: "lou", password: "password",
   except: [:index, :show]

	def index
         @articles = Article.all
	end

	def show
	 @article = Article.find(params[:id])
	end	
	
	def new
	  @article = Article.new
	end
	
	def edit
	 @article = Article.find(params[:id])
	end

	def create
	 @article = Article.new(article_params)

	 if @article.save
	   redirect_to @article
         else
           render 'new'
	end
end
	
	def update 
	   @article = Article.find(params[:id])
	   if @article.update(article_params)
		redict_to @article
	    else
		render 'edit'
	   end
	end

	def destory
	  @article = Article.find(params[:id])
	  @article.destory

	 redirect_to articles_path
	end

      private
	def article_params
         params.require(:article).permit(:title,:text)
        end
end
