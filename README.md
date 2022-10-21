# テーブル設計

## users テーブル（ユーザー管理）（deviseを使う）

| Column                                     | Type       | Options                        |
| ------------------------------------------ | ---------- | ------------------------------ |
| nick_name                                  | string     | null: false                    |
| email                                      | string     | null: false                    |
| password                                   | string     | null: false                    |
| date_of_birth (year)                       | string     | null: false                    |
| date_of_birth (month)                      | string     | null: false                    |
| date_of_birth (day)                        | string     | null: false                    |
| first_name(Chinese characters)             | string     | null: false                    |
| last_name(Chinese characters)              | string     | null: false                    |
| first_name(Katakana)                       | string     | null: false                    |
| last_name(Katakana)                        | string     | null: false                    |
### Association

- has_many : orders                                
- has_many : exhibits

## orders テーブル（商品購入機能）

| Column                                     | Type       | Options                        |
| ------------------------------------------ | ---------- | ------------------------------ |
| nick_name                                  | references | null: false, foreign_key: true |
| card_information(number)                   | string     | null: false                    |
| card_information(deadline)                 | string     | null: false                    |
| card_information(csv)                      | string     | null: false                    |
| shipping_address(post_code)(add_a_hyphen)  | string     | null: false                    |
| shipping_address(prefectures)              | string     | null: false                    |
| shipping_address(municipalities)           | string     | null: false                    |
| shipping_address(address)                  | string     | null: false                    |
| shipping_address(building_name)            | string     | null: true                     |
| phone_number(no hyphen)                    | string     | null: false                    |
###  Association
- has_many : users
- belongs_to : exhibits

## exhibits テーブル（商品出品）

| Column                                     | Type       | Options                        |
| ------------------------------------------ | ---------- | ------------------------------ |
| name                                       | references | null: false, foreign_key: true |
| product_image                              | text       | null: false                    |
| product_name                               | string     | null: false                    |
| product_description                        | string     | null: false                    |
| product_details(category)                  | string     | null: false                    |
| product_details(commodity_condition)       | string     | null: false                    |
| delivery(delivery_charge)                  | string     | null: false                    |
| delivery(region_of_origin)                 | string     | null: false                    |
| delivery(days_to_Ship)                     | string     | null: false                    |
| price                                      | string     | null: false                    |
### Association
- belongs_to : orders
