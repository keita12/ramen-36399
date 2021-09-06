# users テーブル
| Column          | Type       | Options                  |
|-----------------|----------- |--------------------------|
| nickname        | string     | null: false              |
| email           | string     | null; false,unique: true |
| password        | string     | null: false              |

has_many :ramen
has_many :comments
has_many :likes

# ramen テーブル
| Column          | Type       | Options                  |
|-----------------|----------- |--------------------------|
| store_name      | string     | null: false              |
| ramen_name      | string     | null: false              |
| star_id         | integer    | null: false              |
| text            | text       | null: false              |
| user            | references | foreign_key: true        |

belongs_to :user
has_many :comments
has_many :likes

# comments テーブル
| Column          | Type       | Options           |
|-----------------|----------- |-------------------|
| user            | references | foreign_key: true |
| ramen           | references | foreign_key: true |
| text            | text       | null: false       |

belongs_to :user
belongs_to :ramen

# likes テーブル
| Column          | Type       | Options           |
|-----------------|----------- |-------------------|
| user            | references | foreign_key: true |
| ramen           | references | foreign_key: true |
belongs_to :user
belongs_to :ramen