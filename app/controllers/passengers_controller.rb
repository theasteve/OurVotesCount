class PassengersController < ApplicationController


  def index
  end

  def new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    @user = User.find(current_user.id)
    @transportation = Transportation.find(params[:transportation_id])
    @driver = User.find(@transportation.transporter_id)
    @protest = Protest.find(@transportation.destination_id)
    @transportations = Transportation.where(destination_id: @protest.id)
    has_ride = false

    @transportations.each do |transportation|
      passenger = Passenger.find_by user_id: current_user.id
      unless (passenger.nil?)
        has_ride = true
      end
    end

    if has_ride
      redirect_to protests_path, notice: "You already have a ride."
      return
    end

    respond_to do |format|
      if @passenger.save
        format.html { redirect_to user_protest_transportation_passenger_path(id: @passenger.id), notice: 'Passenger was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @driver = get_driver
    if @driver
      @transportation = Transportation.where(transporter_id: @driver.id).first!
      @protest = Protest.find(@transportation.destination_id)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @passenger = Passenger.find_by(user_id: params[:user_id], transportation_id: params[:transportation_id])
    if @passenger
      @passenger.destroy
      redirect_to user_protests_path, notice: 'Ride was canceled.'
    else
      redirect_to user_protest_transportations_path, notice: 'Error: the passenger record failed to delete.'
    end
  end

  private

  def get_driver
      driver = nil
      p = Passenger.find_by(user_id: current_user.id, transportation_id: params[:transportation_id])
      t = Transportation.find(params[:transportation_id])
      driver = User.find(t.transporter_id)
  end

  def passenger_params
    params.permit(:user_id, :transportation_id)
  end

end
