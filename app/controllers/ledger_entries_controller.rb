class LedgerEntriesController < ApplicationController
  def index
	if session[:user_id] == nil || User.find(params[:id]).id != session[:user_id]
		redirect_to root_path
	end
    @ledger_entries = LedgerEntry.all
  end

  def show
	if session[:user_id] == nil || User.find(params[:id]).id != session[:user_id]
		ledger_entries_user_path(session[:user_id])
	end
    @ledger_entries = LedgerEntry.where(user_id: params[:id])
  end

  def user_entries
	if session[:user_id] == nil || User.find(params[:id]).id != session[:user_id]
		redirect_to ledger_entries_user_path(session[:user_id])
	end
    @ledger_entries = LedgerEntry.where(user_id: params[:id])
  end

  def new
  end

  private
  def ledger_entry_params
    params.require(:ledger_entry).permit(:status, :quantity, :total_cost, :item_id, :user_id, :id)
  end
end
