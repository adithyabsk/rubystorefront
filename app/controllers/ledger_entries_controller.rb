class LedgerEntriesController < ApplicationController
  def index
	  if session[:user_id] == nil
		  redirect_to root_path
    end
    if params.has_key?(:next_state_entry_id)
      le = LedgerEntry.find(params[:next_state_entry_id]).set_next_state!
    end
    @ledger_entries =
      if params.has_key?(:show_all)
        LedgerEntry.all
      else
        LedgerEntry.where(user_id: params[:id])
      end
    @is_admin = current_user.is_admin
  end

  def new
  end

  private
  def ledger_entry_params
    params.require(:ledger_entry).permit(:status, :quantity, :total_cost, :item_id, :user_id, :id)
  end
end
