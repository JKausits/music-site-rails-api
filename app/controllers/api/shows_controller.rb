class Api::ShowsController < ApplicationController
  before_action :set_show, only: [:update, :destroy]
  before_action :set_venue, only: [:create]

  def index
    @shows = Show.all
    @shows = @shows.filter_start_at(Date.strptime(params['start_date'], "%m/%d/%Y")) if params['start_date']
    @shows = @shows.filter_end_at(Date.strptime(params['end_date'], "%m/%d/%Y")) if params['end_date']

    render json: @shows, only: [:id, :name, :start_at, :end_at], include: { venue: { only: [:id, :name] } }
  end

  def create
    @show = @venue.shows.create(show_params)
    render json: @show, only: [:id, :name, :rate, :start_at, :end_at], status: :created
  end

  def update
    @show.update(show_params)
    render json: @show, only: [:id, :name, :rate, :start_at, :end_at]
  end

  def destroy
    @show.destroy
    head :no_content
  end

  private
  def set_venue
    @venue = Venue.find(params[:venue_id])
  end

  def set_show
    @show = Show.find(params[:id])
  end

  def show_params
    params.permit([:name, :end_at, :start_at, :rate])
  end
end
