# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = ["Kamaboko", "ゆーた", "さすけ", "のがみ", "ひろ", "ふる", "ユイ", "麒麟"]
titles = [  "時間の止まった瞬間",  "自然の美しさ",  "人々の営み",  "色彩の対比",  "光の影響",  "動きのある静止画",  "都市の息吹",  "自然の驚異",  "静寂の美",  "暖かな色調",  "青い空と白い雲",  "大自然の迫力",  "人々の表情",  "一期一会の出会い",  "夜の魅力",  "色彩のグラデーション",  "人間と動物の共存",  "都市の夜景",  "空と大地の出会い",  "自然と人間の調和"]
comments = [  "心に残る瞬間を切り取る",  "自然の美しさを堪能する",  "人々の暮らしを感じる",  "色彩の調和が美しい",  "光と影が描くドラマチックな世界",  "瞬間を永遠に刻み込む",  "都市の息吹を感じる",  "自然の驚異に驚く",  "静けさの美を味わう",  "暖かい色調が心地よい",  "空が美しく広がる風景",  "大自然の力強さを感じる",  "人々の表情に想いを馳せる",  "出会いが人生を豊かにする",  "夜の輝きに心奪われる",  "色彩のグラデーションが美しい",  "動物との触れ合いが癒し",  "都会の輝きを堪能する",  "自然の壮大さに圧倒される",  "自然と人間の調和が美しい"]


100.times do |n|
    @post = Post.create(
        nickname: names.sample,
        titles: titles.sample,
        comments: comments.sample,
        likeCounts: rand(100),
        pickup: false
    )
    downloaded_image = URI.parse("https://source.unsplash.com/random").open
    @post.images.attach(io: downloaded_image, filename: "test.png")
end

# 10.times do |n|
#     @event = Event.create(
#         eventname: "テストイベント#{n+1}",
#         contents: "テスト#{n+1}です",
#         term: Date.today + 1
#     )

#     @event.tags << Tag.find_or_create_by(tagname: "タグ#{n+1}")

#     @event.image.attach(io: File.open("./public/test.png"), filename: "test.png")
# end