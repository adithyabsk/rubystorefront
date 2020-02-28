class LedgerEntriesController < ApplicationController
  def index
    @ledger_entries = LedgerEntry.all
  end

  def show
    @ledger_entries = LedgerEntry.where(user_id: params[:id])
  end

  def user_entries
    @ledger_entries = LedgerEntry.where(user_id: params[:user_id])
    render "show"
  end

  def new
  end

  private
  def ledger_entry_params
    params.require(:ledger_entry).permit(:status, :quantity, :total_cost, :item_id, :user_id, :id)
  end
end
