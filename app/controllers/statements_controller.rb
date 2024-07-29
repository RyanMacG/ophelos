class StatementsController < ApplicationController
  before_action :authenticate_user!

  def new
    @statement = current_user.statements.new
  end

  def create
    @statement = current_user.statements.new(statement_params)

    if @statement.save
      redirect_to statement_path(@statement), notice: 'Statement created successfully'
    else
      render :new, alert: 'Statement invalid'
    end
  end

  def index
    @statements = current_user.statements
  end

  def show
    @statement = current_user.statements.find(params[:id])
  end

  private

  def statement_params
    params.require(:statement).permit(incomes_attributes: %i[id _destroy name amount],
                                      expenditures_attributes: %i[id _destroy
                                                                  name amount])
  end
end
