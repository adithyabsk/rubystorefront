class LedgerEntriesController < ApplicationController
  def index
    if session[:user_id] == nil
      redirect_to root_path
    end
    @ledger_entries = current_user.is_admin? ? LedgerEntry.order(params[:sort]).select { |i| (params[:user_id] == nil || User.find(i.user_id).name == params[:user_id] || params[:user_id] == "All") && (params[:item_id] == nil || Item.find(i.item_id).name == params[:item_id] || params[:item_id] == "All")} : LedgerEntry.where(user_id: params[:id]).order(params[:sort]).select { |i| (params[:item_id] == nil || Item.find(i.item_id).name == params[:item_id] || params[:item_id] == "All")}
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
