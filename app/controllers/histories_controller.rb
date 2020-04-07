class HistoriesController < ApplicationController
  before_action :set_history, only: [:show, :edit, :update, :destroy]

  def index
    @histories = History.all
    if @histories
      render json: {
        histories: @histories
      }
    else
      render json: {
        status: 500,
        errors: ['no histories found']
      }
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @history.update(history_params)
        format.html { redirect_to @history, notice: 'Secret was successfully updated.' }
        format.json { render :show, status: :ok, location: @history }
      else
        format.html { render :edit }
        format.json { render json: @history.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
  end

  private
  def set_history
    @history = History.find(params[:id])
  end

  def history_params
    params.require(:history).permit(:user_id, :ad_id, :has_been_seen)
  end

end
