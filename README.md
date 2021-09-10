# Re麺bar

## 概要

#### ラーメンの写真の投稿ができます。
#### 投稿に対してコメントやいいねを受け取ることができます。
#### 検索機能や投稿一覧から簡単に美味しいラーメン屋を探せます！

## 本番環境

### Web URL: https://ramen-36399.herokuapp.com/

### Basic認証
- ID: keita
- PASS: 0323

### ログイン情報(テスト用)
- メールアドレス: test@test
- パスワード: 123456

## 利用方法
### まず初めにログインします。
### ログインすると投稿機能とコメント機能といいね機能が利用できるようになります。
### それ以外の検索機能や投稿詳細ページや投稿者の詳細ページや投稿の一覧表示はログインしていなくても利用することができます。

## 目指した課題解決
- 美味しいラーメン屋を簡単に探したい人。
- 美味しいラーメン屋が見つかったけれど店についてもっと詳しく知りたい人。
## 工夫した点
- いいね機能の実装を非同期通信で実装したこと
- 投稿がメインなのでシンプルなデザインにこだわって仕上げたこと
- エラー文を日本語標記にしたこと

## 要件定義
- デプロイ
- データベース設計
- Basic認証
- ユーザ管理機能
- 投稿機能
- 投稿の一覧表示機能
- 投稿の詳細表示機能
- 投稿の編集機能
- 投稿の削除機能
- コメント機能
- いいね機能
- 検索機能
- 投稿者のマイページの実装
- S3の導入

# 実装機能
## 投稿機能
[![Image from Gyazo](https://i.gyazo.com/e02394959e95b158f01995abc0bec78e.gif)](https://gyazo.com/e02394959e95b158f01995abc0bec78e)
## 投稿の一覧表示機能
[![Image from Gyazo](https://i.gyazo.com/56e44d3931cd9923815c7db2609d4599.gif)](https://gyazo.com/56e44d3931cd9923815c7db2609d4599)
## 投稿の詳細画面
[![Image from Gyazo](https://i.gyazo.com/da3470f262880526966decb046ad5e9b.gif)](https://gyazo.com/da3470f262880526966decb046ad5e9b)
## 投稿の編集機能
[![Image from Gyazo](https://i.gyazo.com/c9936daf99c0fea5efed37ecb3096a24.gif)](https://gyazo.com/c9936daf99c0fea5efed37ecb3096a24)
## 投稿の削除機能
[![Image from Gyazo](https://i.gyazo.com/6e15733cdb98158deff9672cf697c5df.gif)](https://gyazo.com/6e15733cdb98158deff9672cf697c5df)
## コメント機能
[![Image from Gyazo](https://i.gyazo.com/f0d79177f5455671ab7208077b7f5e77.gif)](https://gyazo.com/f0d79177f5455671ab7208077b7f5e77)
## いいね機能
[![Image from Gyazo](https://i.gyazo.com/fdfabd82f2426a5648a91fb7cbc59263.gif)](https://gyazo.com/fdfabd82f2426a5648a91fb7cbc59263)
## 検索機能
[![Image from Gyazo](https://i.gyazo.com/9017a3f70fdd93e03c87c48d76b2b370.gif)](https://gyazo.com/9017a3f70fdd93e03c87c48d76b2b370)

## 使用技術
### バックエンド
Ruby,Ruby on rails 
### フロントエンド
JavaScript,JQuery
### データベース
MySQL,SeaquelPro
### インフラ
AWS(EC2)
### ソース管理
GitHub,GitHubDesktop
### テスト
RSpec
### エディタ
VSCode
## DB設計

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

