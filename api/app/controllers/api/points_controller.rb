class Api::PointsController < ApplicationController
  has_scope :by_uf, as: :uf, only: :index
  has_scope :by_city, as: :city, only: :index
  has_scope :by_name, as: :name, only: :index
  has_scope :by_items, as: :items, only: :index

  def index
    @resource = apply_scopes(Point).all.page(current_page).per(per_page)

    render json: PointSerializer.new(
      @resource,
      pagination_options
    ).serialized_json, status: :ok
  end

  def create
    point = Point.new(points_params)

    if point.save
      render json: PointSerializer.new(
        point
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
      render json: PointSerializer.new(@point).serialized_json, status: :ok
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