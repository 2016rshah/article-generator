class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy]
    def index
        @articles = Article.all.order("created_at DESC")
    end
    
    def create
        @article = Article.new(article_params)
        @article.save()
        redirect_to @article
    end
    
    def show
        #@article is defined in the before_action
    end
    
    def destroy
        @article.destroy
        redirect_to root_path
    end

    def edit

    end

    def update
      if @article.update_attributes(params[:article].permit(:title, :author, :date, :content))
         redirect_to :action => 'show', :id => @article
      else
         render :action => 'edit', :id => @article
      end
   end
    
    private
    
    def article_params
        params.require(:article).permit(:title, :author, :date, :content)
    end
    
    def find_article
        @article = Article.find(params[:id])    
    end
    
end
