class CurriculumsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_curriculums, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @curriculums = Curriculum.all.order("created_at DESC")
  end

  def new
    @curriculum = Curriculum.new
  end

  def create
    @curriculum = Curriculum.new(curriculum_params)
    if @curriculum.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @curriculum.update(curriculum_params)
      redirect_to curriculum_path(@curriculum)
    else
      render :edit
    end
  end

  def destroy
      @curriculum.destroy
      redirect_to root_path
  end


private

  def curriculum_params
    params.require(:curriculum).permit(:category_id, :class_name, :class_info, :class_url, :image).merge(user_id: current_user.id)
  end

  def set_curriculums
    @curriculum = Curriculum.find(params[:id])
  end

  def move_to_index
    redirect_to root_path if current_user.id != @curriculum.user_id
  end
end

