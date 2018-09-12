# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, presence: true
  validate :does_not_overlap_approved_request
  
  belongs_to :cat,
  foreign_key: :cat_id,
  class_name: :Cat
  
  def overlapping_requests
    CatRentalRequest
    .where.not(id: id) #not ourself
    .where(cat_id: cat_id) #only for current cat
    .where.not(
      "start_date > :our_end OR end_date < :our_start", 
      our_end: end_date, our_start: start_date
    )
    #other.start_date not earlier than our.end_date
    #OR other.end_date not later than our.start_date
  end
  
  def overlapping_approved_requests
    overlapping_requests.where(status: "APPROVED")
  end
  
  def does_not_overlap_approved_request
    overlapping_approved_requests.exists?
  end
  
end
