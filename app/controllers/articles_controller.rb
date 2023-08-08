class ArticlesController < ApplicationController

    def new
        @article = Article.new
    end

    def index
        @articles = Article.all
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was successfully saved"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end

    def create 
        @article = Article.new(article_params)
        @article.user = User.last
        if @article.save
            flash[:notice] = "Article was successfully saved"
            redirect_to articles_path(@article)
        else
            render 'new'
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path, notice: "Article was successfully deleted."
      end

    private 

    def article_params
        params.require(:article).permit(:title, :description)
    end 

end