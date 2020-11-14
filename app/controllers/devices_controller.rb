class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def index
    @devices = policy_scope(Device)
  end

  def new
    @device = Device.new
    authorize @device
  end

  def create
    @device = Device.new(device_params)
    @device.user = current_user

    if @device.save
      redirect_to devices_path
    else
      render :new
    end
  end

  def show
    authorize @device
  end

  def edit
    authorize @device
  end

  def update
  end

  def destroy
    @device.destroy
    authorize @device
    redirect_to devices_path
  end

  private

  def device_params
    params.require(:device).permit(:device_type, :description, :location, :price)
  end

  def set_device
    @device = Device.find(params[:id])
  end
end
