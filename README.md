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

- has_many :orders
- has_many :items
- has_many :comments


## addresses テーブル

| Column          | Type   | Options                         |
| ----------------| ------ | --------------------------------|
| order_id        | integer| null: false, foreign_key:true   |
| post_number     | string | null: false                     |
| prefecture_id   | integer| null: false                     |
| city            | string | null: false                     |
| block           | string | null: false                     |
| building        | string |                                 |
| tele_number     | string | null: false                     |


### Association

- belongs_to :order



## items テーブル

| Column          | Type   | Options                        |
| ----------------| ------ | ------------------------------ |
| item_name       | string | null: false                    |
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
- has_one :order

## orders テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ------------------------------|
| user_id       | integer    | null: false, foreign_key:true |
| item_id       | integer    | null: false, foreign_key:true |


### Association

- has_one :address
- belongs_to :item
- belongs_to :user



## comments テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ------------|
| comment_id | integer    | null: false |
| text       | text       | null: false |

### Association

- belongs_to :user

