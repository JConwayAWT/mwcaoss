class EmploymentApplicationsController < ApplicationController
  before_action :set_employment_application, only: [:show, :edit, :update, :destroy]

  # GET /employment_applications
  # GET /employment_applications.json
  def index
    raise ActionController::RoutingError.new('Not Found')
  end

  # GET /employment_applications/1
  # GET /employment_applications/1.json
  def show
    raise ActionController::RoutingError.new('Not Found')
  end

  # GET /employment_applications/new
  def new
    raise ActionController::RoutingError.new('Not Found')
  end

  # GET /employment_applications/1/edit
  def edit
    raise ActionController::RoutingError.new('Not Found')
  end

  # POST /employment_applications
  # POST /employment_applications.json
  def create
    @employment_application = EmploymentApplication.new(employment_application_params)

    respond_to do |format|
      if @employment_application.save
        # alert the appropriate person at AOSS
        ApplicationMailer.new_employment_application(@employment_application.id).deliver!

        # destroy their resume to save space on the machine
        @employment_application.resume.destroy
        @employment_application.resume.clear
        @employment_application.save

        format.html { redirect_to "/application_accepted" }
        format.json { render :show, status: :created, location: @employment_application }
      else
        format.html { redirect_to "/application_rejected" }
        format.json { render json: @employment_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employment_applications/1
  # PATCH/PUT /employment_applications/1.json
  def update
    respond_to do |format|
      if @employment_application.update(employment_application_params)
        format.html { redirect_to @employment_application, notice: 'Employment application was successfully updated.' }
        format.json { render :show, status: :ok, location: @employment_application }
      else
        format.html { render :edit }
        format.json { render json: @employment_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employment_applications/1
  # DELETE /employment_applications/1.json
  def destroy
    @employment_application.destroy
    respond_to do |format|
      format.html { redirect_to employment_applications_url, notice: 'Employment application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employment_application
      @employment_application = EmploymentApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employment_application_params
      params.require(:employment_application).permit(
        :name, :business_name, :address, :telephone, 
        :email, :current_sop_details, :how_did_you_hear, 
        :resume)
    end
end
