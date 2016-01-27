class ArticlesController < ApplicationController
    before_action :find_article, only: [:show, :edit, :update, :destroy]
    def index
        @articles = Article.all.order("created_at DESC")
    end
    
    def create
      if verify_recaptcha(:model => @post, :message => "Oh! It's error with reCAPTCHA!", :private_key => ENV["RECAPTCHA_PRIVATE_KEY"])
        @article = Article.new(article_params)
        if @article.save
          redirect_to @article
        else
          redirect_to :action => 'errorPage'
        end
      else
          redirect_to :action => 'errorPage'
      end
    end

    def errorPage
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
