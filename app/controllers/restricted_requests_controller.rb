class RestrictedRequestsController < ApplicationController
  before_action :set_restricted_request, only: [:show, :edit, :update, :destroy]

  # GET /restricted_requests
  # GET /restricted_requests.json
  def index
    @restricted_requests = RestrictedRequest.all
  end

  # GET /restricted_requests/1
  # GET /restricted_requests/1.json
  def show
  end

  # GET /restricted_requests/new
  def new
    @restricted_request = RestrictedRequest.new
  end

  # GET /restricted_requests/1/edit
  def edit
  end

  # POST /restricted_requests
  # POST /restricted_requests.json
  def create
    @restricted_request = RestrictedRequest.new(restricted_request_params)

    respond_to do |format|
      if @restricted_request.save
        format.html { redirect_to @restricted_request, notice: 'Restricted request was successfully created.' }
        format.json { render :show, status: :created, location: @restricted_request }
      else
        format.html { render :new }
        format.json { render json: @restricted_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restricted_requests/1
  # PATCH/PUT /restricted_requests/1.json
  def update
    respond_to do |format|
      if @restricted_request.update(restricted_request_params)
        format.html { redirect_to @restricted_request, notice: 'Restricted request was successfully updated.' }
        format.json { render :show, status: :ok, location: @restricted_request }
      else
        format.html { render :edit }
        format.json { render json: @restricted_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restricted_requests/1
  # DELETE /restricted_requests/1.json
  def destroy
    @restricted_request.destroy
    respond_to do |format|
      format.html { redirect_to restricted_requests_url, notice: 'Restricted request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restricted_request
      @restricted_request = RestrictedRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restricted_request_params
      params.fetch(:restricted_request, {})
    end
end
