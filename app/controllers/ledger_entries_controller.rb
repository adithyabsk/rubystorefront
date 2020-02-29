class LedgerEntriesController < ApplicationController
  def index
    if session[:user_id] == nil
      redirect_to root_path
    end
    show_all = params.has_key?(:show_all) and current_user.is_admin?
    @ledger_entries = show_all ? LedgerEntry.all : LedgerEntry.where(user_id: params[:id])
    if [:entry_id, :action_option].all? { |k| params.key?(k) }
      LedgerEntry.find(params[:entry_id]).send (params[:action_option] + "!").to_sym, current_user
      respond_to do |format|
        format.js {render inline: "location.reload();" }
      end
    end
  end

  private

  def ledger_entry_params
    params.require(:ledger_entry).permit(:status, :quantity, :total_cost, :item_id, :user_id, :id, :action_options, :entry_id, :show_all)
  end
end
