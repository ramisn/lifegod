class ConstructionExpensesController < ApplicationController
  before_action :set_construction_expense, only: [:show, :edit, :update, :destroy]

  # GET /construction_expenses
  # GET /construction_expenses.json
  def index
    @construction_expenses = ConstructionExpense.all
  end

  # GET /construction_expenses/1
  # GET /construction_expenses/1.json
  def show
  end

  # GET /construction_expenses/new
  def new
    @construction_expense = ConstructionExpense.new
  end

  # GET /construction_expenses/1/edit
  def edit
  end

  # POST /construction_expenses
  # POST /construction_expenses.json
  def create
    @construction_expense = ConstructionExpense.new(construction_expense_params)

    respond_to do |format|
      if @construction_expense.save
        format.html { redirect_to construction_expenses_url, notice: 'Construction expense was successfully created.' }
        format.json { render :show, status: :created, location: @construction_expense }
      else
        format.html { render :new }
        format.json { render json: @construction_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /construction_expenses/1
  # PATCH/PUT /construction_expenses/1.json
  def update
    respond_to do |format|
      if @construction_expense.update(construction_expense_params)
        format.html { redirect_to @construction_expense, notice: 'Construction expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @construction_expense }
      else
        format.html { render :edit }
        format.json { render json: @construction_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /construction_expenses/1
  # DELETE /construction_expenses/1.json
  def destroy
    @construction_expense.destroy
    respond_to do |format|
      format.html { redirect_to construction_expenses_url, notice: 'Construction expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_construction_expense
      @construction_expense = ConstructionExpense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def construction_expense_params
      params.require(:construction_expense).permit(:material_description, :amount, :owner)
    end
end
