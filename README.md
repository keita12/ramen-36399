# Re麺bar

## Re麺barの概要

#### ラーメンの写真の投稿ができます。
#### 投稿に対してコメントやいいねを受け取ることができます。
#### 検索機能や投稿一覧から簡単に美味しいラーメン屋を探せます！

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
### まず初めにログインします。
### ログインすると投稿機能とコメント機能といいね機能が利用できるようになります。
### それ以外のや検索機能や投稿詳細ページや投稿者の詳細ページや投稿の一覧表示はログインしていなくても利用することができます。

## 目指した課題解決
- 美味しいラーメン屋を簡単に探したい人
- 美味しいラーメン屋が見つかったけれど店についてもっと詳しく知りたい。
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

# 実装機能
### 投稿機能
[![demo](https://i.gyazo.com/c9e405ffe6bbba8c19f1062dfb5e093b.gif)](https://gyazo.com/c9e405ffe6bbba8c19f1062dfb5e093b)

### 投稿の一覧表示機能
[![Image from Gyazo](https://i.gyazo.com/4b8317f1b7603311c57ce3918dd1fd88.gif)](https://gyazo.com/4b8317f1b7603311c57ce3918dd1fd88)

### 投稿の詳細表示機能
[![demo](https://i.gyazo.com/c94d5e63eeeb5d9dd86d208614a009f3.jpg)](https://gyazo.com/c94d5e63eeeb5d9dd86d208614a009f3)

### 投稿の編集機能
[![demo](https://i.gyazo.com/b89466093b0ea2f8ec0fe4a056c9a406.gif)](https://gyazo.com/b89466093b0ea2f8ec0fe4a056c9a406)

### 投稿の削除機能
[![Image from Gyazo](https://i.gyazo.com/6d6040de363b776c5334f004385d6359.gif)](https://gyazo.com/6d6040de363b776c5334f004385d6359)

### コメント機能
[![demo](https://i.gyazo.com/10e1f27d06fd515ef96e72410543ba6a.gif)](https://gyazo.com/10e1f27d06fd515ef96e72410543ba6a)

### いいね機能
[![Image from Gyazo](https://i.gyazo.com/667aa36c222c127c80af4ad73c84682a.gif)](https://gyazo.com/667aa36c222c127c80af4ad73c84682a)

### 検索機能
[![Image from Gyazo](https://i.gyazo.com/9ee85e347a3b58f1b714181c61e3680f.gif)](https://gyazo.com/9ee85e347a3b58f1b714181c61e3680f)

## 実装予定の機能
- いいねの数によるランキング機能

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

