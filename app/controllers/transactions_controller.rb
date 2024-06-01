class TransactionsController < ApplicationController
  def list
    @transactions = Transaction.all
    render json: @transactions
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :product_id, :user_id, :tip)
  end
end
