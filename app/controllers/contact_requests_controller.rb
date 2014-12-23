class ContactRequestsController < ApplicationController
  before_action :set_contact_request, only: [:show, :edit, :update, :destroy]

  # GET /contact_requests
  # GET /contact_requests.json
  def index
    raise ActionController::RoutingError.new('Not Found')
  end

  # GET /contact_requests/1
  # GET /contact_requests/1.json
  def show
    raise ActionController::RoutingError.new('Not Found')
  end

  # GET /contact_requests/new
  def new
    raise ActionController::RoutingError.new('Not Found')
  end

  # GET /contact_requests/1/edit
  def edit
    raise ActionController::RoutingError.new('Not Found')
  end

  # POST /contact_requests
  # POST /contact_requests.json
  def create
    @contact_request = ContactRequest.new(contact_request_params)

    respond_to do |format|
      if @contact_request.save
        # alert the appropriate person at AOSS
        ApplicationMailer.new_contact_request(@contact_request.id).deliver!

        format.html { redirect_to @contact_request, notice: 'Contact request was successfully created.' }
        format.json { render :show, status: :created, location: @contact_request }
      else
        format.html { render :new }
        format.json { render json: @contact_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_requests/1
  # PATCH/PUT /contact_requests/1.json
  def update
    raise ActionController::RoutingError.new('Not Found')
  end

  # DELETE /contact_requests/1
  # DELETE /contact_requests/1.json
  def destroy
    raise ActionController::RoutingError.new('Not Found')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_request
      @contact_request = ContactRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_request_params
      params.require(:contact_request).permit(:name, :company, :address, :email, :telephone, :best_time_to_contact, :inquiry_details)
    end
end
