# テーブル設計

## user テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| password           | string  | null:false                |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_day          | integer | null: false               |

### Association

- has_many :items
- has_one :cards
- has_one :buyers



## items テーブル

| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| item_name     | string   | null: false |
| item_text     | text     | null: false |
| category      | string   | null: false |
| condition     | string   | null: false |
| shippind_fee  | string   | null: false |
| area          | string   | null: false |
| shipping_days | string   | null: false |
| price         | integer  | null: false |

### Association

- belongs_to :user



## card テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| card_no         | integer | null: false |
| expiration_date | integer | null: false |
| security_code   | integer | null: false |

### Association

- belongs_to :user



## buyer テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| postal_code | integer | null: false |
| prefecture  | string  | null: false |
| city        | string  | null: false |
| address1    | string  | null: false |
| address2    | string  |             |
| telephone   | integer | null: false |

### Association

- belongs_to :user