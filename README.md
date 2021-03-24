
# アプリケーション名
Beginapp
# 概要
高齢者の方がご当地の食品をインターネットを通して購入するWebアプリケーションです。初めて訪れる方でも操作しやすいページとなっています。
# 本番環境
URL：<br>
ログイン情報（テスト用）<br>
ユーザー１<br>
ユーザー２
# 制作環境（意図）
Webアプリケーションを触る人の中には「自分が操作してどうなるかわからない。」や「変なところを押してしまってパソコンが壊れてしまうのではないか。」という不安からWebアプリケーションを使うのをためらってしまうのが問題です。
操作しやすいWebアプリケーションを作りご当地のおいしい食品をインターネット上で購入してもらうためです。
# DEMO
### トップページ
![画像名](https://github.com/yakyutarou/beginapp/blob/%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E7%AE%A1%E7%90%86%E6%A9%9F%E8%83%BD/toppage.png)
購入するためには会員登録が必要だということをページ上部に表示しています。ボタンを押した後何が起こるのか安心させるために説明を入れています。

### 新規登録ページ
![画像名](https://github.com/yakyutarou/beginapp/blob/%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E7%AE%A1%E7%90%86%E6%A9%9F%E8%83%BD/registration.png)
ページ遷移が正しく行われているか確認してもらうためにページ上部にページの名称を入れました。<br>
入力時の注意点をフォームに吹き出しの形で記述しています。
# 工夫したポイント
読みやすいように文字の大きさを大きくしました。<br>
操作したらどうなるか分からないというのを安心してもらうため説明する画面構成にしました。
# 使用環境
## バックグランド
Ruby、Ruby on Rails
## フロントエンド
HTML、CSS、Javascript、Ajax
## データベース
MySQL
## インフラ
AWS
## ソース管理
GitHub、GitHub Desktop
## テスト
RSpec
## エディタ
VScode
# 課題や今後実装したい機能
・PAY.JPと郵便番号APIを使った購入機能の実装<br>
・出品者をオーナーのみとし、商品の編集・削除の権限をオーナーのみとする
# DB設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false ,unique :true |
| encrypted_password | string | null: false               |

### Association

- has_many :foods
- has_many :buys

## foods テーブル

| Column        | Type       | Options                      |
| ------------- | ---------  | ---------------------------- |      
| food_name     | string     | null: false                  |
| price         | integer    | null: false                  |
| explanation   | text       | null: false                  |
| sell_by       | string     | null: false                  |
| food_hozon_id | integer    | null: false                  |
| user          | references | null: false,foreign_key: true| 

### Association

- belongs_to :user
- has_one :buy

##  buysテーブル

| Column     | Type             |  Options                      |
| ---------- | ----------       | ----------------------------- |
| item       | references       | null: false, foreign_key: true|
| user       | references       | null: false, foreign_key: true|

### Association

- belongs_to :food
- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type       | Options                       |
| -----------   | ---------- | ----------------------------- |
| myouji        | string     | null: false                   |
| namae         | string     | null: false                   |
| kana_myouji   | string     | null: false                   |
| kana_namae    | string     | null: false                   |
| age           | integer    | null: false                   |
| postal_code   | string     | null: false                   |
| area          | string     | null: false                   |
| city          | string     | null: false                   |
| address       | string     | null: false                   |
| building_name | string     |                               | 
| phone_number  | string     | null: false                   |
| buy           | references | null: false,foreign_key: true |

### Association

- belongs_to :buy
