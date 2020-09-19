# README

# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| ---------------| ------ | ----------- |
| nickname       | string | null: false |
| mail           | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana| string | null: false |
| birthday       | date   | null: false |


### Association

- has_many :purchases
- has_many :items
- has_many :comments


## purchases テーブル

| Column      | Type   | Options                         |
| ------------| ------ | --------------------------------|
| user_id     | integer| null: false,  foreign_key: true |
| post_number | string | null: false                     |
| prefecture  | integer| null: false                     |
| city        | string | null: false                     |
| block       | string | null: false                     |
| building    | string |                                 |
| tele_number | string | null: false                     |


### Association

- belongs_to :user
- has_one :management


## items テーブル

| Column          | Type   | Options                        |
| ----------------| ------ | ------------------------------ |
| user_id         | integer| null: false, foreign_key:true  |
| explanation     | text   | null: false                    |
| category_id     | integer| null: false                    |
| state_id        | integer| null: false                    |
| fee_delivery_id | integer| null: false                    |
| area_delivery_id| integer| null: false                    |
| day_delivery_id | integer| null: false                    |
| price           | integer| null: false                    |


### Association

- belongs_to :user
- has_one :managements

## managements テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ------------------------------|
| user_id       | integer    | null: false, foreign_key:true |
| item_id       | integer    | null: false, foreign_key:true |


### Association

- belongs_to :purchase
- belongs_to :item


## comments テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ------------|
| comment_id | integer    | null: false |
| text       | text       | null: false |

### Association

- belongs_to :user