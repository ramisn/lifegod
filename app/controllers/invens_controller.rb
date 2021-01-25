class InvensController < ApplicationController
  before_action :set_inven, only: [:show, :edit, :update, :destroy]

  # GET /invens
  # GET /invens.json
  def index
    @invens = Inven.all
    @collections = Collection.all
    @collection_without_donations = @collections.where("collection_type !=?", 2)
    @total = @collection_without_donations.group(:name).sum(:amount).to_a
    # @total = @collections.group(:name).sum(:amount).to_a
    @total_collections = @collection_without_donations.sum(:amount)
    @total_by_location =  @collection_without_donations.group(:location).sum(:amount).to_a
    # @total_by_location =  @collections.group(:location).sum(:amount).to_a
    @donations = @collections.group(:collection_type, :name).sum(:amount).to_a
    @total_donations = @collections.where("collection_type=?", 2).sum(:amount)
    
    @location_count = Location.count
    @family_count = Family.count
    @expenses = Expense.all.group(:expense_type).sum(:amount).to_a
    @total_expenses = Expense.all.sum(:amount)
    @const_expenses = ConstructionExpense.all.group(:owner).sum(:amount).to_a
    @total_const_expenses = ConstructionExpense.all.sum(:amount)
  end

  # GET /invens/1
  # GET /invens/1.json
  def show
  end

  # GET /invens/new
  def new
    @inven = Inven.new
  end

  # GET /invens/1/edit
  def edit
  end

  # POST /invens
  # POST /invens.json
  def create
    @inven = Inven.new(inven_params)

    respond_to do |format|
      if @inven.save
        format.html { redirect_to @inven, notice: 'Inven was successfully created.' }
        format.json { render :show, status: :created, location: @inven }
      else
        format.html { render :new }
        format.json { render json: @inven.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invens/1
  # PATCH/PUT /invens/1.json
  def update
    respond_to do |format|
      if @inven.update(inven_params)
        format.html { redirect_to @inven, notice: 'Inven was successfully updated.' }
        format.json { render :show, status: :ok, location: @inven }
      else
        format.html { render :edit }
        format.json { render json: @inven.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invens/1
  # DELETE /invens/1.json
  def destroy
    @inven.destroy
    respond_to do |format|
      format.html { redirect_to invens_url, notice: 'Inven was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inven
      @inven = Inven.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inven_params
      params.require(:inven).permit(:location, :name)
    end
end
