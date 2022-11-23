# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
    @post = Post.create(
        nickname: "テスト#{n+1}君",
        titles: "テスト#{n+1}",
        comments: "テスト#{n+1}だよ",
        likeCounts: rand(100),
        pickup: false
    )
    @post.images.attach(io: File.open("./public/test.png"), filename: "test.png")

    @event = Event.create(
        eventname: "テストイベント#{n+1}",
        contents: "テスト#{n+1}です",
        term: Date.today + 1
    )

    @event.tags << Tag.find_or_create_by(tagname: "タグ#{n+1}")

    @event.image.attach(io: File.open("./public/test.png"), filename: "test.png")
end