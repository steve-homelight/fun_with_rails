class AddIndexToUploadedTransaction < ActiveRecord::Migration[5.1]
  def change
    add_index :uploaded_transactions, :selling_date
    add_index :uploaded_transactions, :status
    add_index :uploaded_transactions, :property_type
  end
end
