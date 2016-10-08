class PostSub < ActiveRecord::Base
  validates :post, :sub, presence: true
  validates :post_id, uniqueness: { scope: :sub_id }

  belongs_to :post,
    class_name: :Post,
    primary_key: :id,
    foreign_key: :post_id

  belongs_to :sub,
    class_name: :Sub,
    primary_key: :id,
    foreign_key: :sub_id
end
