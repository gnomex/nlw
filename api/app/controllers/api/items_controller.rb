class Api::ItemsController < ApplicationController

  def index
    @resource = Item.all.page(current_page).per(per_page)

    render json: ItemSerializer.new(
      @resource,
      pagination_options
    ).serialized_json, status: :ok
  end

  def create
    item = Item.new(item_params)

    if item.save
      render json: ItemSerializer.new(
        @resource
      ).serialized_json, status: :created
    else
      render json: { 
        errors: item.errors.full_messages 
      }, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find_by(id: params[:id])

    if @item
      render json: ItemSerializer.new(@item).serialized_json, status: :ok
    else
      head :not_found
    end
  end

  def image 
    @item = Item.find_by(id: params[:id])

    if @item&.image&.attached?
      redirect_to rails_blob_url(@item.image)
    else
      head :not_found
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :image)
  end
end