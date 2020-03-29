# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show; end

  # GET /categories/new
  def new
    if session[:user_id].nil? || !User.find(session[:user_id]).is_admin
      redirect_to categories_path
    end
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
    if session[:user_id].nil? || !User.find(session[:user_id]).is_admin
      redirect_to categories_path
    end
  end

  # POST /categories
  # POST /categories.json
  def create
    if session[:user_id].nil? || !User.find(session[:user_id]).is_admin
      redirect_to categories_path
    end
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    if session[:user_id].nil? || !User.find(session[:user_id]).is_admin
      redirect_to categories_path
    end
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :tax_slab)
  end
end
