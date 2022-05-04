class Api::VenuesController < ApplicationController
  before_action :set_venue, only: [:show,:destroy, :update]
  before_action :set_pagination, only: [:index]

  def index
    @venues = Venue.all
    result = @venues.paginate(page: @page, page_size: @page_size)
    render json: result
  end

  def show
    render json: @venue, only: [:id, :name], include: {shows: { only: [:id, :name, :rate, :start_at, :end_at]}}
  end

  def create
    @venue = Venue.create(venue_params)
    render json: @venue, only: [:id, :name], status: :created
  end

  def update
    @venue.update(venue_params)
    render json: @venue, only: [:id, :name]
  end

  def destroy
    @venue.destroy
    head :no_content
  end

  private
  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.permit([:name])
  end
end
