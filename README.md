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
| email                | string | null: false |
| encrypted_password   | string | null: false |
| family_name          | string | null: false |
| name                 | string | null: false |
| family_namekana      | string | null: false |
| namekana             | string | null: false |
| birth                | date   | null: false |

has_many :items
has_many :transactions
has_many :product_purchases

## items テーブル
| Column          | Type         | Options     |
| ----------      | ------------ | ----------- |
| item_name       | string       | null: false |
| text            | text         | null: false |            
| item_price      | integer      | null: false |
| state           | integer      | null: false |
| category        | string       | null: false |
| seller          | string       | null: false |
| send_prefecture | integer      | null: false |
| burden          | integer      | null: false |
| shipping_day    | integer      | null: false |
| user            | references   |             |

belongs_to :user
has_one :transaction
has_one :product_purchase

## transactions テーブル
| Column          | Type         | Options     |
| ----------      | ------------ | ----------- |
| post_number     | string       | null: false |
| prefecture      | integer      | null: false |
| municipality    | string       | null: false |
| address         | text         | null: false |
| build_name      | text         |             |
| phone_nuber     | text         | null: false |
| buyer           | integer      | null: false |

belongs_to :user
belongs_to :item
has_one :product_purchase



## product_purchases テーブル
| Column          | Type         | Options     |
| user            | references   |             |
| category        | references   |             |
| state           | references   |             |
| burden          | references   |             |
| send_prefecture | references   |             |
| shipping_day    | references   |             |

belongs_to :user
belongs_to :item
belongs_to :transactions