# README

# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|email|string|null: false, unique: true|
|password|string|null: false|

### Association
- has_many :user_groups
- has_many :groups, through: :user_groups
- has_many :messages

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|

### Association
- has_many :user_groups
- has_many :users, through: :user_groups
- has_many :messages

## user_groupsテーブル

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
