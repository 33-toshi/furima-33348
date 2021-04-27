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

|Column               |Type      |Options
|---------------------|----------|-----------------------
|nickname             |string    |null:false
|email                |string    |null:false,unique:true
|encrypted_password   |string    |null:false
|last_name            |string    |null:false
|first_name           |string    |null:false
|last_name_kana       |string    |null:false
|first_name_kana      |string    |null:false
|birthday             |date      |null:false

### Association
has_many :products
has_many :orders

## products

|Column          |Type      |Options
|----------------|----------|-------------------
|product_name    |string    |null:false
|description     |text      |null:false
|category_id     |integer   |null:false
|detail_id       |integer   |null:false
|delivery_fee_id |integer   |null:false
|area_id         |integer   |null:false
|duration_id     |integer   |null:false
|price           |integer   |null:false
|user            |references|foreign_key: true

### Association
belongs_to :user
has_many :orders


## addresses

Column           |Type      |Options
|----------------|----------|-------------------
|postal_code     |string    |null:false
|area_id         |integer   |null:false
|city            |string    |null:false
|house_number    |string    |null:false
|building_name   |string    |
|phone_number    |string    |null:false
|order           |references|foreign_key: true

### Association
belongs_to :order

## orders

Column   |Type       |Options
|--------|-----------|------------------
|user    |references |foreign_key: true
|product |references |foreign_key: true

### Association
has_one :address
belongs_to :user
belongs_to :product