class Tag < ApplicationRecord
    #中間テーブルとの関連付け
    has_many :post_tags, dependent: :destroy
    #タグとの関連付け
    has_many :posts, through: :post_tags
    #イベントとの関連づけ
    belongs_to :event
    #空白でないこと、一意性チェック
    validates :tagname, presence: true
    validates :tagname, uniqueness: true
end
