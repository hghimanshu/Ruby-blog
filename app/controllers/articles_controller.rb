class ArticlesController < ApplicationController

  def index

    articles = if params[:title].present?
                  Article.where(title: params[:title])
                else
                  Article.all
                end
    render json: articles
  end

  def new

    article = Article.new(article_params(params))

    if article.save
      render json: {success: true, message: "Article created !!"}, status: :ok
    else
      render json: {success: false, errors:article.errors}, status: 400
    end
  end

  private

  def article_params(params)

    params.require(:article).permit(:title, :content)
  end
end
