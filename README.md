# Re麺bar

# Re麺barの概要

# Re麺barのURL

## Web URL: https://ramen-36399.herokuapp.com/

# テスト用アカウント
## Basic認証
- ユーザー名: keita
- パスワード: 0323

## ログイン用アカウント
- 
- 

# 利用方法







# テーブル設計

## users テーブル
| Column          | Type       | Options                  |
|-----------------|----------- |--------------------------|
| nickname        | string     | null: false              |
| email           | string     | null; false,unique: true |
| password        | string     | null: false              |

### Association

- has_many :ramen
- has_many :comments
- has_many :likes

## ramen テーブル
| Column          | Type       | Options                  |
|-----------------|----------- |--------------------------|
| store_name      | string     | null: false              |
| ramen_name      | string     | null: false              |
| star_id         | integer    | null: false              |
| text            | text       | null: false              |
| user            | references | foreign_key: true        |

### Association

belongs_to :user
has_many :comments
has_many :likes

## comments テーブル
| Column          | Type       | Options           |
|-----------------|----------- |-------------------|
| user            | references | foreign_key: true |
| ramen           | references | foreign_key: true |
| text            | text       | null: false       |

### Association

- belongs_to :user
- belongs_to :ramen

## likes テーブル
| Column          | Type       | Options           |
|-----------------|----------- |-------------------|
| user            | references | foreign_key: true |
| ramen           | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :ramen