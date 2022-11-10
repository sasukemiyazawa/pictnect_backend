# APIについて

基本的には/api/v1/resourcesです

# Postリソースについて

## GET /posts
投稿一覧を返します

## GET /posts/:id
単一の投稿と、それに紐づいたタグの名前を返します

## POST /posts
- nickname
- titles
- comments
- images  
をパラメータとして受け付け、投稿を作成します

## PATCH /posts/:id
何もしません

## DELETE /posts/:id
投稿を削除します
