# テーブル設計

## users テーブル

| Column             | Type      | Options      |
| ------------------ | --------- | ------------ |
| nickname           | string    | null: false  |
| email              | string    | null: false  |
| encrypted_password | string    | null: false  |
| last_name          | string    | null: false  |
| first_name         | string    | null: false  |
| last_name_kana     | string    | null: false  |
| first_name_kana    | string    | null: false  |
| birthday           | date      | null: false  |

### Association

- has_many :items
- has_one :order

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | text       | null: false                    |
| item_info          | text       | null: false                    |
| category           | string     | null: false                    |
| item_status        | string     | null: false                    |
| delivery_fee       | string     | null: false                    |
| send_area          | string     | null: false                    |
| send_days          | string     | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| order_id           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order

## orders テーブル

| Column             | Type       | Options                        |
|------------------- | ---------- | ------------------------------ |
| card_info          | string     | null: false                    |
| date_of_expiry     | integer    | null: false                    |
| security_code      | integer    | null: false                    |
| postal_code        | string     | null: false                    |
| prefecture         | string     | null: false                    |
| municipalities     | string     | null: false                    |
| address            | string     | null: false                    |
| building           | text       | null: false                    |
| tel_number         | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :items