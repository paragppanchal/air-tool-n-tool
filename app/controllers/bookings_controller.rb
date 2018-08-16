class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  after_action :authorize_access, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def show
    # before_action => set_booking
  end

  def new
    @tool = Tool.find(params[:tool_id])
    @booking = Booking.new
    @booking.tool = @tool
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @tool = Tool.find(params[:tool_id])
    @booking.tool = @tool
    if @booking.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    # before_action => set_booking
  end

  def update
    # before_action => set_booking
    @tool = @booking.tool
    @booking.update(booking_params)
    redirect_to root_url
  end

  def destroy
    # before_action => set_booking
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :photo)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def authorize_access
    authorize @booking
  end
end
