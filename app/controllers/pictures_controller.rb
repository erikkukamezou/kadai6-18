class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  def index
    @pictures = Picture.all.order(created_at: :desc)
  end
  def new
    @picture = Picture.new
  end
  def create
    @picture = Picture.new(picture_params)
    # @picture.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @picture.save
        redirect_to pictures_path, notice: "作成しました！"
      else
        render :new
      end
    end
  end
  def show
    # @picture = Picture.find(params[:id])
  end
  def edit
    # @picture = Picture.find(params[:id])
  end
  def update
    # @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "ブログを編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"削除しました！"
  end
  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end
  private
  def picture_params
    params.require(:picture).permit(:title, :content, :image, :image_cache)
  end
  def ensure_user
    @pictures = current_user.pictures
    @picture = @pictures.find_by(id: params[:id])
    redirect_to new_picture_path unless @picture
  end
  def set_picture
    @picture = Picture.find(params[:id])
  end
end
