# README

* DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :users_groups
- has_many :groups, through: :users_groups
- has_many :messages

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false|

### Association
- has_many :users_groups
- has_many :users, through: :users_groups
- has_many :messages

## users_groupsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_kye: true|
|group_id|integer|null: false, foreign_kye: true|

### Association
- belongs_to :user
- belongs_to :group

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text|
|image|text|
|user_id|integer|null: false, foreign_kye: true|
|group_id|integer|null: false, foreign_kye: true|

### Association
- belongs_to :user
- belongs_to :group
