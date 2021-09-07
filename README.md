## Re麺bar

## Re麺barの概要

## Re麺barのURL

### Web URL: https://ramen-36399.herokuapp.com/

## テスト用アカウント
### Basic認証
- ID: keita
- PASS: 0323

### ログイン用アカウント
- メールアドレス: test@test
- パスワード: 123456

## 利用方法

## 目指した課題解決

## 要件定義
### データベース設計
### Basic認証
### ユーザ管理機能
### 投稿機能
### 投稿の一覧表示機能
### 投稿の詳細表示機能
### 投稿の編集機能
### 投稿の削除機能
### いいね機能
### 検索機能
### 投稿者の詳細ページ








## テーブル設計

### users テーブル
| Column          | Type       | Options                  |
|-----------------|----------- |--------------------------|
| nickname        | string     | null: false              |
| email           | string     | null; false,unique: true |
| password        | string     | null: false              |

### Association

- has_many :ramen
- has_many :comments
- has_many :likes

### ramen テーブル
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

### comments テーブル
| Column          | Type       | Options           |
|-----------------|----------- |-------------------|
| user            | references | foreign_key: true |
| ramen           | references | foreign_key: true |
| text            | text       | null: false       |

### Association

- belongs_to :user
- belongs_to :ramen

### likes テーブル
| Column          | Type       | Options           |
|-----------------|----------- |-------------------|
| user            | references | foreign_key: true |
| ramen           | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :ramen