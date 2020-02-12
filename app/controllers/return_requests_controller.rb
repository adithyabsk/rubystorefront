class ReturnRequestsController < ApplicationController
  before_action :set_return_request, only: [:show, :edit, :update, :destroy]

  # GET /return_requests
  # GET /return_requests.json
  def index
    @return_requests = ReturnRequest.all
  end

  # GET /return_requests/1
  # GET /return_requests/1.json
  def show
  end

  # GET /return_requests/new
  def new
    @return_request = ReturnRequest.new
  end

  # GET /return_requests/1/edit
  def edit
  end

  # POST /return_requests
  # POST /return_requests.json
  def create
    @return_request = ReturnRequest.new(return_request_params)

    respond_to do |format|
      if @return_request.save
        format.html { redirect_to @return_request, notice: 'Return request was successfully created.' }
        format.json { render :show, status: :created, location: @return_request }
      else
        format.html { render :new }
        format.json { render json: @return_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /return_requests/1
  # PATCH/PUT /return_requests/1.json
  def update
    respond_to do |format|
      if @return_request.update(return_request_params)
        format.html { redirect_to @return_request, notice: 'Return request was successfully updated.' }
        format.json { render :show, status: :ok, location: @return_request }
      else
        format.html { render :edit }
        format.json { render json: @return_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /return_requests/1
  # DELETE /return_requests/1.json
  def destroy
    @return_request.destroy
    respond_to do |format|
      format.html { redirect_to return_requests_url, notice: 'Return request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_return_request
      @return_request = ReturnRequest.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def return_request_params
      params.require(:return_request).permit(:date)
    end
end
