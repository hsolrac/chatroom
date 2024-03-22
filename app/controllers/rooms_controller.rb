class RoomsController < ApplicationController
  before_action :load_users_and_rooms, only: [:index, :show]

  def index
    @room = Room.new
    
    render 'index'
  end

  def show 
    @single_room = Room.find(params[:id])
    @room = Room.new

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    render 'index'
  end

  def create
    @room = Room.create(name: params["room"]["name"])
    if @room.save 
      redirect_to room_path(@room), notice: 'Room created successfully'
    else
      render :index
    end
  end

  private 

  def load_users_and_rooms
    @users = User.all_except(Current.user)
    @rooms = Room.public_rooms
  end
end
