class Agent < ApplicationRecord
  has_many :uploaded_seller_transactions, class_name: "UploadedTransaction", foreign_key: :listing_agent_id
  has_many :uploaded_buyer_transactions, class_name: "UploadedTransaction", foreign_key: :selling_agent_id

  def all_transactions(params)
    UploadedTransaction.where("listing_agent_id = ? OR selling_agent_id = ?", id, id)
                       .paginate(:page => params[:page]).order('id DESC')
  end

  def recent_transactions
    all_transactions.where("selling_date > ?", 6.months.ago)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
