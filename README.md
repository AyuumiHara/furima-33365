# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_day          | date    | null: false               |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| item_name        | string     | null: false       |
| item_text        | text       | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| shipping_fee_id  | integer    | null: false       |
| area_id          | integer    | null: false       |
| shipping_days_id | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase



##  purchases テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user_id | references | foreign_key: true |
| item_id | references | foreign_key: true |

### Association
- has_one :buyer


## buyers テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| purchase_id | references | foreign_key: true |
| postal_code | string     | null: false       |
| area_id     | integer    | null: false       |
| city        | string     | null: false       |
| address1    | string     | null: false       |
| address2    | string     |                   |
| telephone   | string     | null: false       |

### Association

- belongs_to :purchase