class ProtestsController < ApplicationController
  def index
    @protests = Protest.all
  end

  def show
    protest = Protest.find(params[:id])
  end

  def new
    @protest = Protest.new
  end

  def edit
  end

  def create
    @protest = Protest.new(protest_params)
    respond_to do |format|
      if @protest.save
        format.html { redirect_to @protest, notice: 'Protest was successfully created.' }
        format.json { render :show, status: :created, location: @protest }
      else
        format.html { render :new }
        format.json { render json: @protest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @protest.update(protest_params)
        format.html { redirect_to @protest, notice: 'Protest was successfully updated.' }
        format.json { render :show, status: :ok, location: @protest }
      else
        format.html {render :edit }
        format.json { render json: @protest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @protest.destroy
    respond_to do |format|
      format.html
    end
  end

  private

  def protest_params
    params.require(:protest).permit(:name, :description, :location, :time, :creator, :image)
  end

end
