# README

アプリケーション名	
e SCHOOL

アプリケーション概要	このアプリケーションでできることを記述。
・ユーザー管理機能
・投稿機能
・投稿詳細機能
・投稿削除機能
・受講機能

URL	デプロイ済みのURLを記述。デプロイが済んでいない場合は、デプロイが完了次第記述すること。
http://52.198.4.251/

テスト用アカウント	ログイン機能等を実装した場合は、ログインに必要な情報を記述。またBasic認証等を設けている場合は、そのID/Passも記述すること。
Basic認証 
ID：eshool
Pass：115312

生徒①
email：test＠test.com
pass：111111ss

生徒②
email：test1＠test.com
pass：222222ss


利用方法	このアプリケーションの利用方法を記述。
・簡易のユーザー登録を実施。
・投稿機能から、受講したい画像をクリックして授業を行う
・投稿者は、編集や削除ができる。
・（会員サービス（月額）を設けて、クレジット決済を実施。会員の方は、Live配信が見れたり受講後テストが受けられる）

目指した課題解決	このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記述。
・YouTubeだとどこに何があるかわかりづらい
・誰でもどこでも学びたい意欲があれば、教育を受けられる環境をつくる
・学校では学べないことを学べる環境を整えたい

洗い出した要件	スプレッドシートにまとめた要件定義を記述。
https://docs.google.com/spreadsheets/d/1_WaGFyymkE_tWt9gtxbQgJAK8lU_vQCthbhRGNG-BbQ/edit#gid=0

実装した機能についての画像やGIFおよびその説明	実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。


実装予定の機能	洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。
・クレジットカード決済機能
・動画投稿機能
・検索機能
・投稿者と受講者を分けたユーザー登録

データベース設計	ER図等を添付。
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| child_name         | string | null: false               |
| child_name_kana    | string | null: false               |
| child_birthday     | date   | null: false               |
| parent_name        | string | null: false               |
| parent_name_kana   | string | null: false               |
| parent_birthday    | date   | null: false               |

### Association

- has_many :lectures
- has_many :studies
- has_one  :address


## lectures テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| category_id | integer    | null: false                    |
| class_name  | string     | null: false                    |
| class_info  | text       | null: false                    |
| class_url   | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- has_one    :study
- belongs_to :user


## studies テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| lecture | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :lecture


## address テーブル

| Column        | Type            | Options                        |
| --------------| --------------- | ------------------------------ |
| postal_code   | string          | null: false                    |
| prefecture_id | integer         | null: false                    |
| city          | string          | null: false                    |
| block         | string          | null: false                    |
| building      | string          |                                |
| phone_number  | string          | null: false                    |
| user          | references      | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :card


## card テーブル

| Column         | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| card_token     | string     | null: false                    |
| customer_token | string     | null: false                    |
| address        | references | null: false, foreign_key: true |

### Association

- belongs_to :address