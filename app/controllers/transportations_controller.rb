class TransportationsController < ApplicationController
  def index
  end

  def new
    @protest = Protest.find(params[:protest_id])
    @transportation = Transportation.new
  end

  def create
    @protest = Protest.find(params[:protest_id])
    @transportation = Transportation.new(transportation_params)
    @transportation.destination_id = @protest.id
    @transportation.transporter_id = current_user.id

    respond_to do |format|
      if @transportation.save
        format.html { redirect_to user_protest_transportation_path(id: @transportation.id), notice: 'Transportation was successfully created.' }
        format.json { render :show, status: :created, location: @transportation }
      else
        format.html { render :new }
        format.json { render json: @transportation.errors, status: :unprocessable_entity }
      end
    end

  end

  def show
    @transportation = Transportation.find(params[:id])
    @protest = Protest.find(@transportation.destination_id)
  end

  def edit
  end

  def update
  end

  def destroy
  end



  private

  def transportation_params
    params.require(:transportation).permit(:pickup_location, :vehicle, :capacity, :destination)
  end
end
