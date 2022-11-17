# APIについて

基本的には/api/v1/resourcesです

# Postリソースについて

## GET /posts
投稿一覧を返します

## GET /posts/:id
単一の投稿と、それに紐づいたタグの名前を返します

## POST /posts
- nickname(string)
- titles(string)
- comments(string)
- images(画像)
- tags(string,カンマ区切りで複数指定可)

をパラメータとして受け付け、投稿を作成します

## PATCH /posts/:id
何もしません

## DELETE /posts/:id
投稿を削除します

# Eventリソースについて

## GET /events
イベント一覧を返します

## GET /events/:id
単一のイベントと、それに紐づいたタグの名前を返します

## POST /events
- eventname(string)
- contents(string)
- term(int型で日数を指定)
- image(画像)
- tags(string,カンマ区切りで複数指定可)

をパラメータとして受け付け、イベントを作成します

## PATCH /events/:id
- eventname(string)
- contents(string)
- term(int型で日数を指定)
- image(画像)
- tags(string,カンマ区切りで複数指定可)

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
- eventname(string)
- contents(string)
- term(int型で日数を指定)
- image(画像)
- tags(string,カンマ区切りで複数指定可)

をパラメータとして受け付け、イベントを編集します

## DELETE /tags/:id
タグを削除します
