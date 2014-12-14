class ArticlesController < ApplicationController

	def new

	end

	def create
		# render plain: params[:article].inspect
		# above will show what hash is passed to db
		@article = Article.new(article_params)
		@article.save

		redirect_to @article
	end

	def show
		@article = Article.find(params[:id])
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
			redirect_to @article
		else
			render 'edit'
		end

	end

	def destroy
		@article = Article.find(params[:id])

		@article.destroy

		redirect_to @index
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

end
