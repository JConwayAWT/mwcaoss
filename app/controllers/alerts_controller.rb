class AlertsController < ApplicationController
  before_action :set_alert, only: [:show, :edit, :update, :destroy]

  # GET /alerts
  # GET /alerts.json
  def index
    redirect_to "/"
  end

  # GET /alerts/1
  # GET /alerts/1.json
  def show
    redirect_to "/"
  end

  # GET /alerts/new
  def new
    @alert = Alert.new
  end

  # GET /alerts/1/edit
  def edit
    redirect_to "/"
  end

  # POST /alerts
  # POST /alerts.json
  def create
    @alert = Alert.new(alert_params)

    if (Rails.env == "development" and @alert.password != "password")
      flash[:alert] = "The administrator password was not correct.  Please try again."
      render action: 'new' and return
    elsif (Rails.env != "development" and @alert.password != ENV["ADMINISTRATOR_PASSWORD"])
      flash[:alert] = "The administrator password was not correct. Please try again."
      render action: 'new' and return
    end

    respond_to do |format|
      if @alert.save
        format.html { redirect_to "/", notice: 'Alert was successfully created.' }
        format.json { render :show, status: :created, location: @alert }
      else
        format.html { render :new }
        format.json { render json: @alert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /alerts/1
  # PATCH/PUT /alerts/1.json
  def update
    redirect_to "/"
  end

  # DELETE /alerts/1
  # DELETE /alerts/1.json
  def destroy
    redirect_to "/"
  end

  def delete
    @alerts = Alert.all
  end

  def delete_alerts
    if (Rails.env == "development" and params["Password"] != "password")
      flash[:alert] = "The administrator password was not correct.  Please try again."
      @alerts = Alert.all
      render action: 'delete' and return
    elsif (Rails.env != "development" and params["Password"] != ENV["ADMINISTRATOR_PASSWORD"])
      flash[:alert] = "The administrator password was not correct. Please try again."
      @alerts = Alert.all
      render action: 'delete' and return
    end

    params.keys.each do |key|
      if key.to_i.to_s == key
        Alert.find(key.to_i).destroy
      end
    end

    redirect_to "/"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alert_params
      params.require(:alert).permit(:message, :lifespan_in_hours, :password)
    end
end
