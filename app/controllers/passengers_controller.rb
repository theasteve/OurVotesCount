class PassengersController < ApplicationController


  def index
  end

  def new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    @user = User.find(params[:user_id])
    @transportation = Transportation.find(params[:transportation_id])
    @driver = User.find(@transportation.transporter_id)

    respond_to do |format|
      if @passenger.save
        format.html { redirect_to user_protest_transportation_passenger_path(id: @passenger.id), notice: 'Protest was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @driver = get_driver
    @transportation = Transportation.where(transporter_id: @driver.id).first!
    @protest = Protest.find(@transportation.destination_id)
  end

  def edit
  end

  def update
  end

  def destroy
    @passenger = Passenger.where(user_id: current_user.id, transportation_id: params[:transportation_id]).first!
    if @passenger
      @passenger.destroy
    else
      redirect_to user_protests_path, notice: 'Ride was canceled.'
    end
  end

  private

  def get_driver
      p = Passenger.where(user_id: current_user.id, transportation_id: params[:transportation_id]).first!
      t = Transportation.find(p.transportation_id)
      @driver = User.find(t.transporter_id)
  end

  def passenger_params
    params.permit(:user_id, :transportation_id)
  end

end
