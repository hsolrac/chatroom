class RoomsController < ApplicationController
  def index
    @room = Room.new
    @rooms = Room.public_rooms
    @users = User.all_except(Current.user)
  end

  def show 
  end

  def create
    @room = Room.create(name: params[:name])
    if @room.save 
      redirect_to room_path(@room), notice: 'Room created successfully'
    else
      render :index
    end
  end
end
