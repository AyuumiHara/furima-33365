# テーブル設計

## user テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_day          | day     | null: false               |

### Association

- has_many :items
- has_many :buyers



## items テーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| item_name        | string   | null: false |
| item_text        | text     | null: false |
| category_id      | integer  | null: false |
| condition_id     | integer  | null: false |
| shippind_fee_id  | integer  | null: false |
| area_id          | integer  | null: false |
| shipping_days_id | integer  | null: false |
| price            | integer  | null: false |
| user_id          |          |             |

### Association

- belongs_to :user



## buyer テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| address1      | string  | null: false |
| address2      | string  |             |
| telephone     | string  | null: false |

### Association

- belongs_to :user