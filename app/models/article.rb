class Article < ActiveRecord::Base
    has_many :comments, dependent: :destroy
    # dependent 关联删除
    validates :title, presence: true,
        length: {minimum: 5}
end
