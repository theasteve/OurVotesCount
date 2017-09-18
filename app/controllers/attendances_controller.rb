class AttendancesController < ApplicationController

  def create
    @user = current_user
    @protest = Protest.find(params[:protest_id])
    @attendance = Attendance.new(user_id: @user.id, protest_id: @protest.id)
    @attendance.save

    @attendance.to_json
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
  end


end
