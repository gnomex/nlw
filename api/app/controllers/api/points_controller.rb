class Api::PointsController < ApplicationController

  def index
    @resource = Point.all.page(current_page).per(per_page)

    render json: PointSerializer.new(
      @resource,
      pagination_options
    ).serialized_json, status: :ok
  end

  def create
    point = Point.new(points_params)

    if point.save
      render json: ItemSerializer.new(
        @resource
      ).serialized_json, status: :created
    else
      render json: { 
        errors: point.errors.full_messages 
      }, status: :unprocessable_entity
    end
  end

  def show
    @point = Item.find_by(id: params[:id])

    if @point
      render json: ItemSerializer.new(@point).serialized_json, status: :ok
    else
      head :not_found
    end
  end

  def image 
    @point = Point.find_by(id: params[:id])

    if @point&.image&.attached?
      redirect_to rails_blob_url(@point.image)
    else
      head :not_found
    end
  end

  private

  def points_params
    params.require(:point).permit(
      :name,
      :email,
      :about,
      :instagram,
      :whataspp,
      :lat,
      :long,
      :image
    )
  end
end