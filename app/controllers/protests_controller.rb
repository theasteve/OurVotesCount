class ProtestsController < ApplicationController


  def index
    @protests = Protest.all
  end

  def show
    @protest = Protest.find(params[:id])
    @user = current_user
    @transportation = Transportation.find(params[:id])
  end

  def new
    @protest = Protest.new
  end

  def edit
    @protest = Protest.find(params[:id])
  end

  def create
    @protest = Protest.new(protest_params)
    @protest.creator = current_user
    respond_to do |format|
      if @protest.save
        format.html { redirect_to @protest, notice: 'Protest was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @protest = Protest.find(params[:id])

    respond_to do |format|
      if @protest.update(protest_params)
        format.html { redirect_to @protest, notice: 'Protest was successfully updated.' }
      else
        format.html {render :edit }
      end
    end
  end

  def destroy
    @protest = Protest.find(params[:id])
    @protest.destroy

    redirect_to protests_path
  end

  private

  def protest_params
    params.require(:protest).permit(:name, :description, :location, :starts_at, :creator, :image)
  end

end
