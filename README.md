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