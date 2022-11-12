class Post < ApplicationRecord
  include Rails.application.routes.url_helpers
  #ActiveStorageのファイル関連付けメソッド  
  has_one_attached :images

  #中間テーブルとの関連付け
  has_many :post_tags, dependent: :destroy
  #タグとの関連付け
  has_many :tags, through: :post_tags

  # 紐づいている画像のURLを取得する
  def images_url
    images.attached? ? url_for(images) : nil
  end
end
