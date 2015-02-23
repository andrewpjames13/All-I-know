class CategoriesController < ApplicationController

  before_action :authenticate, except: [:index, :show]

  def new
    @category = Category.new
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @category = Category.new(category_params)
    @topic = Topic.find(params[:topic_id])
    @category.topic_id = params[:topic_id]
      if @category.save
        redirect_to topic_path(@topic)
      else
        render :new
      end
  end

  def show
    @category = Category.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def edit
    @category = Category.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def update
    @category = Category.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    if @category.update(category_params)
      redirect_to topic_path(@topic)
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    if @category.destroy
      redirect_to topic_path(@topic)
    else
      render :show
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
