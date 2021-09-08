# Re麺bar

## Re麺barの概要

### ラーメンの写真の投稿ができます。
### 検索機能や投稿一覧から簡単に美味しいラーメン屋を探せます！

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

## 工夫した点

## 要件定義
### デプロイ
### データベース設計
### Basic認証
### ユーザ管理機能
### 投稿機能
### 投稿の一覧表示機能
### 投稿の詳細表示機能
### 投稿の編集機能
### 投稿の削除機能
### コメント機能
### いいね機能
### 検索機能
### 投稿者のマイページの実装

# 実装機能
### 投稿機能
[![Image from Gyazo](https://i.gyazo.com/c9e405ffe6bbba8c19f1062dfb5e093b.gif)](https://gyazo.com/c9e405ffe6bbba8c19f1062dfb5e093b)
### 投稿の一覧表示機能
[![Image from Gyazo](https://i.gyazo.com/e94a4b423d1dbd8bbe5ef34c6dd5669d.gif)](https://gyazo.com/e94a4b423d1dbd8bbe5ef34c6dd5669d)
### 投稿の詳細表示機能
[![Image from Gyazo](https://i.gyazo.com/c94d5e63eeeb5d9dd86d208614a009f3.jpg)](https://gyazo.com/c94d5e63eeeb5d9dd86d208614a009f3)
### 投稿の編集機能
[![Image from Gyazo](https://i.gyazo.com/b89466093b0ea2f8ec0fe4a056c9a406.gif)](https://gyazo.com/b89466093b0ea2f8ec0fe4a056c9a406)
### 投稿の削除機能
[![Image from Gyazo](https://i.gyazo.com/fed13a03cdb5ddf2c938de5fa4c7eafb.gif)](https://gyazo.com/fed13a03cdb5ddf2c938de5fa4c7eafb)
### コメント機能
[![Image from Gyazo](https://i.gyazo.com/10e1f27d06fd515ef96e72410543ba6a.gif)](https://gyazo.com/10e1f27d06fd515ef96e72410543ba6a)
### いいね機能
[![Image from Gyazo](https://i.gyazo.com/4b8e9142fc45a61bb80ef1480ea2243b.gif)](https://gyazo.com/4b8e9142fc45a61bb80ef1480ea2243b)
### 検索機能
[![Image from Gyazo](https://i.gyazo.com/2211d83c99205984890b0469e15963d6.gif)](https://gyazo.com/2211d83c99205984890b0469e15963d6)
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