require "open-uri"

names = ["Kamaboko", "ゆーた", "さすけ", "のがみ", "ひろ", "ふる", "ユイ", "麒麟"]
titles = [  "時間の止まった瞬間",  "自然の美しさ",  "人々の営み",  "色彩の対比",  "光の影響",  "動きのある静止画",  "都市の息吹",  "自然の驚異",  "静寂の美",  "暖かな色調",  "青い空と白い雲",  "大自然の迫力",  "人々の表情",  "一期一会の出会い",  "夜の魅力",  "色彩のグラデーション",  "人間と動物の共存",  "都市の夜景",  "空と大地の出会い",  "自然と人間の調和"]
comments = [  "心に残る瞬間を切り取る",  "自然の美しさを堪能する",  "人々の暮らしを感じる",  "色彩の調和が美しい",  "光と影が描くドラマチックな世界",  "瞬間を永遠に刻み込む",  "都市の息吹を感じる",  "自然の驚異に驚く",  "静けさの美を味わう",  "暖かい色調が心地よい",  "空が美しく広がる風景",  "大自然の力強さを感じる",  "人々の表情に想いを馳せる",  "出会いが人生を豊かにする",  "夜の輝きに心奪われる",  "色彩のグラデーションが美しい",  "動物との触れ合いが癒し",  "都会の輝きを堪能する",  "自然の壮大さに圧倒される",  "自然と人間の調和が美しい"]

Tag.destroy_all
PostTag.destroy_all
Post.destroy_all
Event.destroy_all

# --- Tags ---
tags = %w[旅行 グルメ 音楽 スポーツ 勉強 恋愛 ライフハック]
tags.each do |t|
  Tag.create!(tagname: t)
end

# 画像を一度だけダウンロードして使い回す（ロック防止）
image_file = URI.open("https://picsum.photos/200")

2.times do
  post = Post.create!(
    nickname: names.sample,
    titles: titles.sample,
    comments: comments.sample,
    likeCounts: rand(100),
    pickup: false
  )

  file = URI.open("https://picsum.photos/200")
  post.images.attach(io: file, filename: "test.png")

  # タグをランダム付与
  post.tags << Tag.order("RANDOM()").limit(rand(1..3))
end

# --- Events ---
events = %w[さくらコンテスト 動物コンテスト]
events.each do |e|
  Event.create!(
    eventname: e,
    contents: "#{e}です",
    term: Date.today + 1
  )
end
