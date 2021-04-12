# アプリケーション名
Shareapp

# 概要
それぞれのルームにメモを残すことができるアプリケーションを作成した。
- アカウントの登録、編集
- メッセージの送信、画像の送信
- ログイン、ログアウト
- メッセージのお気に入り登録

# 本番環境

https://infomation-app.herokuapp.com/

ログイン情報（テスト用）

- Eメール: test@gmail.com
- パスワード: test12345
- ユーザー名: test

- Githubリポジトリ
https://github.com/ricky0906/shareapp

# 制作背景（意図）
アウトドア用品店で働いていて、商品在庫の状況や店舗の情報などの情報共有がインカムや紙のノートによる伝達方法だけで不便が多い。
このメモを残す情報共有のアプリケーションで業務の効率を上げたいと思った。
### 問題点
- ノートによる共有方法だとお客様に在庫状況など聞かれた時にすぐに対応することができない
- 何度もスタッフカウンターに戻り確認、もしくは情報の更新をするのが手間であり時間のロス
- 古い情報を認識してしまうことが起きる

- インカムでの共有では時間差がなく対応できるが、担当社員が別件で対応中だと対処できない
- 耳からの情報なので何度も同じ情報を聞かれることがある
- 担当社員の負担が大きい

これらの問題をメモを残すアプリを使うことで誰でもすぐに情報共有することができる。
### メモアプリを使うことで起こること
- 在庫の状況や店舗のイベント情報など、即座に調べることができる。
- 気づいたひとがすぐに情報を更新できる。
- ある程度の情報を全員が知ることができるので、担当部門以外のスタッフ、アルバイトスタッフでも対応できる幅が広がり、
社員スタッフの負担が大きく軽減される。
- 新商品や主力商品の情報をメモに残すことで、スタッフ一人一人の知識が増え、対応できる幅が広がる。

# DEMO

# 工夫したポイント
- roomテーブルに始めからチャットルーム名の値を保存させるために、マイグレーションファイルを作成し、直接始めから入れる値を記述した。
始めはroomテーブルにcreateを使って必要なチャットルームを保存していたが、本番環境にデプロイするとその情報は反映されていないことに気がついた。
- 画像を選択するとプレビューを表示する機能を実装した
画像選択した際に自分がなんの画像を選択しているのかわかりやすくするため
- favoritesテーブルを作成しuser_idとmessage_idでどのユーザーがどのメッセージをお気に入りにしているかを管理した。
お気に入りにしたメッセージをマイページで閲覧できるようにページを追加した。
# 使用技術(開発環境)
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

# 課題や今後開発したい機能
- 見た目がシンプルすぎるのでそれぞれのメモの印象が薄く、飛ばされてしまう可能性があるので、メッセージの見た目を印象強くする。
- メモの保存をできるようにする。（機能追加済み）
商品の情報や大事な店舗情報等をあとで見返すことができるようにするため
- それぞれのルームでさらに商品の情報と在庫の状況で、ルームを分ける
メモが多くなってきた時に、更に知りたい情報を分割することで、ピンポイントで情報を検索できるようにするため
- 商品名等でメモの検索をかけることができる機能
ピンポイントで商品の情報を検索できるようにするため

# DB設計

## usersテーブル

| column      | type     | options         |
| ----------- | -------- | --------------- |
| nickname    | string   | null: false     |
| first_name  | string   | null: false     |
| last_name   | string   | null: false     |
| email       | string   | null: false     |
| password    | string   | null: false     |

### associations
- has_many :messages
- has_many :favorites, dependent: :destroy
- has_many :favorite_messages, through: :favorites, source: :message

## roomsテーブル

| column | type   | options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### associations
- has_many :messages

## messagesテーブル

| column  |   type     | options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### associations
- belongs_to :user
- belongs_to :message
- has_many :favorites, dependent: :destroy

## favoritesテーブル

| column  |   type     | options                        |
| ------- | ---------- | ------------------------------ |
| message | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### associations
- belongs_to :message
- belongs_to :user