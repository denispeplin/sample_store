class SettingsController < ApplicationController
  def index
    render json: Setting.all
  end

  def update
    @setting = Setting.find params[:id]

    if @setting.update_attributes(setting_params)
      render json: @setting
    else
      render json: @setting.errors, status: :unprocessable_entity
    end
  end

  private

  def setting_params
    params.require(:setting).permit(:number)
  end
end
