class StudiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :move_to_index

  def index
    @study = Study.new
  end

  def create
    # @order_address = OrderAddress.new(order_params)
    # if @order_address.valid?
    #   pay_item
    #   @order_address.save
    #   redirect_to root_path
    # else
    #   render :index
    # end
  end

  private

  # def order_params
  #   params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :building, :block, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: @item.id)
  # end

  def set_order
    @curriculum = Curriculum.find(params[:curriculum_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @curriculum.user_id
  end
end
