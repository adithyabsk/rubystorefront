# frozen_string_literal: true

class LedgerEntriesController < ApplicationController
  def admin_entries
    LedgerEntry.order(params[:sort]).select do |entry|
      (params[:user_id].nil? ||
          User.find(entry.user_id).name == params[:user_id] ||
          params[:user_id] == 'All'
      ) && (params[:item_id].nil? ||
          Item.find(entry.item_id).name == params[:item_id] ||
          params[:item_id] == 'All'
           )
    end
  end

  def user_entries
    LedgerEntry.where(user_id: params[:id]).order(params[:sort]).select do |entry|
      (params[:item_id].nil? ||
          Item.find(entry.item_id).name == params[:item_id] ||
          params[:item_id] == 'All'
      )
    end
  end

  def index
    redirect_to root_path if invalid_session?
    @ledger_entries = current_user.admin? ? admin_entries : user_entries

    if %i[entry_id action_option].all? { |key| params.key?(key) }
      if params[:action_option].to_s == 'approve_return'
        send_status_email('approved', 'return', LedgerEntry.find(params[:entry_id]))
        @ledger_entry = LedgerEntry.find(params[:entry_id])
        @item = @ledger_entry.item
        @item.inventory = @item.inventory + @ledger_entry.quantity
        @item.popularity = @item.popularity - @ledger_entry.quantity
        @item.save
      elsif params[:action_option].to_s == 'approve_restricted'
        send_status_email('approved', 'restricted', LedgerEntry.find(params[:entry_id]))
      elsif params[:action_option].to_s == 'reject_return'
        send_status_email('denied', 'return', LedgerEntry.find(params[:entry_id]))
      elsif params[:action_option].to_s == 'reject_restricted'
        send_status_email('denied', 'restricted', LedgerEntry.find(params[:entry_id]))
        @ledger_entry = LedgerEntry.find(params[:entry_id])
        @item = @ledger_entry.item
        @item.inventory = @item.inventory + @ledger_entry.quantity
        @item.popularity = @item.popularity - @ledger_entry.quantity
        @item.save
      end
      LedgerEntry.find(params[:entry_id]).send (params[:action_option] + '!').to_sym, current_user
      respond_to do |format|
        format.js { render inline: 'location.reload();' }
      end
    end
  end

  def send_status_email(status, type, ledger_entry)
    UserMailer.with(status: status, type: type, item: ledger_entry.item, user: ledger_entry.user).status_of_request_email.deliver_now
  end

  private

  def ledger_entry_params
    params.require(:ledger_entry).permit(:status, :quantity, :total_cost, :item_id, :user_id, :id, :action_options, :entry_id, :show_all)
  end
end
