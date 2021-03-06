class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.create(image_params)
    @post = current_user.posts.create(post_params.deep_merge({mediable: @image}))
    # byebug
    if @post.new_record?
      render json: {errors: @post.errors, type: @post.mediable_type}, status: :unprocessable_entity
    else
      render json: {message: "All is good!", type: @post.mediable_type}, status: :created
      # redirect_to root_path, format: :html
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @images = Image.all
    @image = Image.find(params[:id])

    @image.update_attributes(image_params)
  end

  def delete
    @image = Image.find(params[:product_id])
  end

  def destroy
    @images = Image.all
    @image = Image.find(params[:id])
    @image.destroy
  end

  private
    def image_params
      params.require(:image).permit(:media)
    end

    def post_params
      params.require(:post).permit(:title, :category_id, :hashtag_list)
    end
end
