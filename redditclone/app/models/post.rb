# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  sub_id     :bigint           not null
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
	validates :title, presence: true 

	belongs_to :sub,
	inverse_of: :posts
	 
	belongs_to :author,
	class_name: :User

  has_many :post_subs,
	dependent: :destroy

	has_many :subs,
	through: :post_subs,
	source: :sub
  
end
