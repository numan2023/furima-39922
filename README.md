# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false, unique: true |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| kanji_name         | string  | null: false               |
| kana_name          | string  | null: false               |
| birthday           | integer | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | text       | null: false                    |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| delivery_region | string     | null: false                    |
| delivery_date   | string     | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one    :purchase

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one    :addresses

## addresses テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| prefectural | string     | null: false                    |
| city        | string     | null: false                    |
| street      | string     | null: false                    |
| building    | string     | null: true                     |
| tel         | integer    | null: false                    |
| purchase_id | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase