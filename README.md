# README

# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ------------| ------ | ----------- |
| id          | integer| null: false |
| nickname    | string | null: false |
| mail        | string | null: false |
| password    | integer| null: false |
| name        | string | null: false |
| name_kata   | string | null: false |
| birthday    | integer| null: false |


### Association

- has_many :purchases
- has_many :exhibits
- has_many :comments

## purchase テーブル

| Column      | Type   | Options     |
| ------------| ------ | ----------- |
| buyer_id    | integer| null: false |
| number      | integer| null: false |
| ex_data     | integer| null: false |
| code        | integer| null: false |
| post_number | integer| null: false |
| todofuken   | string | null: false |
| shicyoson   | string | null: false |
| banchi      | string | null: false |
| tatemonomei | string | null: false |
| tele_number | integer| null: false |


### Association

- belongs_to : users


## exhibits テーブル

| Column       | Type   | Options     |
| -------------| ------ | ----------- |
| item_id      | integer| null: false |
| image        | integer| null: false |
| item_name    | integer| null: false |
| explanation  | integer| null: false |
| category     | integer| null: false |
| state        | string | null: false |
| fee_delivery | string | null: false |
| area_delivery| string | null: false |
| day_delivery | string | null: false |
| price        | integer| null: false |




### Association

- belongs_to :users

## comments テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ------------|
| comment_id | integer    | null: false |
| text       | text       | null: false |

### Association

- belongs_to :users