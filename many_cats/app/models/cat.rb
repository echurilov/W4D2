# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLORS = {orange:"Orange",black:"Black",tabby:"Tabby",white:"White"}
  
  validates :birth_date, :color, :name, :sex, presence: true
  validates :sex, inclusion: {in: ["M","F"]}
  validates :color, inclusion: {in: COLORS}
  
  def age
    # DateTime.now - DateTime.new(birth_date)
  end
  
end
