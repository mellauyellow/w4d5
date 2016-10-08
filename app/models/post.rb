class Post < ActiveRecord::Base
  validates :title, :content, :sub_ids, :author_id, presence: true

  belongs_to :author,
    class_name: :User,
    primary_key: :id,
    foreign_key: :author_id

  has_many :post_subs,
    class_name: :PostSub,
    primary_key: :id,
    foreign_key: :post_id,
    inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub
end
