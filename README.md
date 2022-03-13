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

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_ruby     | string | null: false |
| first_name_ruby    | string | null: false |
| birthday           | date   | null: false |
### Association
- has_many :items
- has_many :buys

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| delivery_charge    | string     | null: false                    |
| shipment_source    | string     | null: false                    |
| days_to_ship       | string     | null: false                    |
| price              | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- has_many :buys

## buys テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :item
- has_one :send

## sends テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| adress_line        | string | null: false |
| building           | string |             |
| phone_number       | string | null: false |
### Association
- belongs_to :buy