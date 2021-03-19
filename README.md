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


## users

|Column     |Type      |Options
|-----------|----------|----------
|nickname   |string    |null:false
|mail       |string    |null:false
|password   |string    |null:false
|name       |string    |null:false
|name_kana  |string    |null:false
|birthday   |date      |null:false

### Association
has_many :product

## product

|Column       |Type     |Options
|-------------|---------|-----------
|image        |         |
|product_name |string   |null:false
|description  |text     |null:false
|details      |         |null:false
|delivery_fee |         |null:false
|area         |         |null:false
|days         |         |null:false
|price        |string   |null:false
|user         |reference|foreign_key: true
### Association
belongs_to :user


## buys

|Column          |Type     |Options
|----------------|---------|-----------
|card_number     |string   |null:false
|expiration_date |string   |null:false
|security        |string   |null:false

### Association
has_one :address

## address

Column           |Type     |Options
|----------------|---------|-----------
|postal_code     |string   |null:false
|prefectures     |         |null:false
|cities          |string   |null:false
|house_number    |string   |null:false
|building_name   |string   |null:false
|phone_number    |string   |null:false

### Association
belongs_to :buys