class StatementsController < ApplicationController
  before_action :authenticate_user!

  def new
    @statement = current_user.statements.new
  end

  def create
    binding.irb
    @statement = current_user.statements.new(statement_params)

    if @statement.save
      redirect_to statements_path, notice: 'Statement created successfully'
    else
      render :new, alert: 'Statement invalid'
    end
  end

  def index
    @statements = current_user.statements
  end

  def show
  end

  private

  def statement_params
    params.require(:statement).permit(incomes_attributes: %i[name amount], expenditures_attributes: %i[name amount])
  end
end
