class RemovecardIdFromCreditCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :credit_cards, :card_id, :string
  end
end
