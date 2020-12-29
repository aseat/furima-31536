class AddressesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user || @item.purchase.present?
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      @purchase_address.save
      pay_item
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def address_params
    params.require(:purchase_address).permit(:post_number, :prefecture_id, :municipality, :addresses, :build_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end
end
