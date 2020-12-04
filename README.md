# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| ----------           | ------ | ----------- |
| nickname             | string | null: false |
| email                | string | unique: true |
| encrypted_password   | string | null: false |
| family_name          | string | null: false |
| name                 | string | null: false |
| family_namekana      | string | null: false |
| namekana             | string | null: false |
| birth                | date   | null: false |

has_many :items
has_many :product_purchases

## items テーブル
| Column             | Type         | Options     |
| -----------------  | ------------ | ----------- |
| name               | string       | null: false |
| text               | text         | null: false |            
| price              | integer      | null: false |
| state_id           | integer      | null: false |
| category_id        | integer      | null: false |
| send_prefecture_id | integer      | null: false |
| burden_id          | integer      | null: false |
| shipping_day_id    | integer      | null: false |
| user               | references   | null: false, foreign_key: true |

belongs_to :user
has_one :product_purchase

## addresses テーブル
| Column          | Type         | Options     |
| ----------      | ------------ | ----------- |
| post_number     | string       | null: false |
| prefecture_id   | integer      | null: false |
| municipality    | string       | null: false |
| address         | string       | null: false |
| build_name      | string       |             |
| phone_nuber     | string       | null: false |
| user            | references   | null: false, foreign_key: product_purchase |

belongs_to :product_purchase



## product_purchases テーブル
| Column             | Type         | Options     |
| user               | references   | null: false, foreign_key: address |
| item               | references   | null: false, foreign_key: address |


belongs_to :user
belongs_to :item
has_one :address