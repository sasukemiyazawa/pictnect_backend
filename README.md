# APIについて

基本的には/api/v1/resourcesです

# Postリソースについて

## GET /posts
投稿一覧を返します

パラメータ
- data.nickname(string)
- data.titles(string)
- data.comments(string)
- data.images_url(string)

## GET /posts/:id
単一の投稿と、それに紐づいたタグの名前を返します

パラメータ
- data.nickname(string)
- data.titles(string)
- data.comments(string)
- data.images_url(string)
- tags(stringの配列)

## POST /posts
- nickname(string)
- titles(string)
- comments(string)
- images(画像)
- tags(stringの配列)

をパラメータとして受け付け、投稿を作成します

## PATCH /posts/:id
何もしません

## DELETE /posts/:id
投稿を削除します

# Eventリソースについて

## GET /events
イベント一覧を返します

パラメータ
- data.eventname(string)
- data.contents(string)
- data.term(string)
- data.image_url(string)

## GET /events/:id
単一のイベントと、それに紐づいたタグの名前を返します

パラメータ
- data.eventname(string)
- data.contents(string)
- data.term(string)
- data.image_url(string)
- tags(stringの配列)

## POST /events
- eventname(string)
- contents(string)
- term("YYYY-MM-DD")
- image(画像)
- tags(stringの配列)

をパラメータとして受け付け、イベントを作成します

## PATCH /events/:id
- eventname(string)
- contents(string)
- term("YYYY-MM-DD")
- image(画像)
- tags(stringの配列)

をパラメータとして受け付け、イベントを編集します

## DELETE /events/:id
イベントを削除します

# tagリソースについて

## GET /tags
タグ一覧を返します

## GET /tags/:id
単一のタグを返します

## POST /tags
- tagname(string)

をパラメータとして受け付け、タグを作成します

## PATCH /tags/:id
- tagname(string)

をパラメータとして受け付け、イベントを編集します

## DELETE /tags/:id
タグを削除します
