# README

# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| ---------------| ------ | ----------- |
| user_id　　　   | integer| null: false |
| nickname       | string | null: false |
| mail           | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kata | string | null: false |
| first_name_kata| string | null: false |
| birthday       | date   | null: false |


### Association

- has_many :purchases
- has_many :exhibits
- has_many :comments


## purchases テーブル

| Column      | Type   | Options                         |
| ------------| ------ | --------------------------------|
| buyer_id    | integer| null: false,                    |
| user_id     | integer| null: false,  foreign_key: true |
| post_number | string | null: false                     |
| prefecture  | integer| null: false                     |
| city        | string | null: false                     |
| block       | string | null: false                     |
| building    | string | null: false                     |
| tele_number | string | null: false                     |


### Association

- belongs_to : user
- belongs_to : exhibit


## exhibits テーブル

| Column          | Type   | Options                        |
| ----------------| ------ | ------------------------------ |
| exhibitor_id    | integer|                                |
| user_id         | integer| null: false,  foreign_key:true |
| item_name       | string | null: false                    |
| explanation     | string | null: false                    |
| category_id     | integer| null: false                    |
| state_id        | integer| null: false                    |
| fee_delivery_id | integer| null: false                    |
| area_delivery_id| integer| null: false                    |
| day_delivery_id | integer| null: false                    |
| price           | integer| null: false                    |


### Association

- belongs_to :user
- has_one :purchase
- has_one :delivery

## deliveries テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| deliver_id    | integer    | null: false |
| fee_delivery  | string     | null: false |
| area_delivery | string     | null: false |
| day_delivery  | string     | null: false |

### Association

- belongs_to :exhibit


## comments テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ------------|
| comment_id | integer    | null: false |
| text       | text       | null: false |

### Association

- belongs_to :user