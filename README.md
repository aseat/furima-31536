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

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| namekana   | string | null: false |
| birth_year | text   | null: false |
| birth_month| text   | null: false |
| birth_day  | text   | null: false |

## items テーブル
| Column          | Type         | Options     |
| ----------      | ------------ | ----------- |
| item_name       | string       | null: false |
| text            | text         | null: false |            
| item_price      | integer      | null: false |
| state           | string       | null: false |
| category        | string       | null: false |
| seller          | string       | null: false |
| send_prefecture | text         | null: false |
| burden          | text         | null: false |
| shipping_day    | text         | null: false |


## transactions テーブル
| Column          | Type         | Options     |
| ----------      | ------------ | ----------- |
| card_number     | integer      | null: false |
| expiration_date | integer      | null: false |            
| security_code   | integer      | null: false |
| post_number     | string       | null: false |
| prefecture      | string       | null: false |
| municipality    | string       | null: false |
| address         | text         | null: false |
| build_name      | text         | null: false |
| phone_nuber     | text         | null: false |
| buyer           | integer      | null: false |

