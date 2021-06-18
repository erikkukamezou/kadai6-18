class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end
  def new
    @picture = Picture.new
  end
  def create
    Picture.create(picture_params)
    redirect_to new_picture_path

  end
  def show
    @picture = Picture.find(params[:id])
  end
  def update
    @picture = Picture.find(params[:id])
    if @blog.update(picture_params)
      redirect_to pictures_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end
  private
  def picture_params
    params.require(:picture).permit(:title, :content)
  end
end
