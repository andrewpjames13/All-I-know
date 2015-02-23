class NotesController < ApplicationController

  before_action :authenticate, except: [:index, :show]

  def new
    @note = Note.new
    @category = Category.find(params[:category_id])
    @topic = Topic.find(params[:topic_id])
  end

  def create
    @note = Note.new(note_params)
    @note.category_id = params[:category_id]

    if @note.save
      redirect_to [@note.category.topic, @note.category]
    else
      render :new
    end
  end

  def show
    @note = Note.find(params[:id])
    @category = Category.find(params[:category_id])
    @topic = Topic.find(params[:topic_id])

  end

  def edit
    @note = Note.find(params[:id])
    @category = Category.find(params[:category_id])
    @topic = Topic.find(params[:topic_id])
  end

  def update
    @note = Note.find(params[:id])
    @category = Category.find(params[:category_id])
    @topic = Topic.find(params[:topic_id])
    if @note.update(note_params)
      redirect_to topic_category_path(@topic, @category)
    else
      render :edit
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @category = Category.find(params[:category_id])
    @topic = Topic.find(params[:topic_id])
    if @note.destroy
      redirect_to topic_category_path(@topic, @category)
    else
      render :show
    end
  end

  private

  def note_params
    params.require(:note).permit(:name, :description)
  end

end
