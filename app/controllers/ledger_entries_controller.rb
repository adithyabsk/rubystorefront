class LedgerEntriesController < ApplicationController
  def index
	  if session[:user_id] == nil
		  redirect_to root_path
    end
    if params.has_key?(:next_state_entry_id)
      le = LedgerEntry.find(params[:next_state_entry_id]).set_next_state!
    end
    @ledger_entries = LedgerEntry.all
    @is_admin = current_user.is_admin
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
    if params.has_key?(:next_state_entry_id)
      le = LedgerEntry.find(params[:next_state_entry_id]).set_next_state!
    end
    @ledger_entries = LedgerEntry.where(user_id: params[:id])
    @is_admin = current_user.is_admin
  end

  def new
  end

  private
  def ledger_entry_params
    params.require(:ledger_entry).permit(:status, :quantity, :total_cost, :item_id, :user_id, :id)
  end
end
