# Looks Yum - 美味しい野菜の見分け方

食材の選択をする際に、どういうポイントに注視すると「上質な食材」を見分けられるのか、を情報集約するアプリケーションです。

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* Docker

  * コンテナイメージをビルド

    ```
    docker-compose build
    ```

  * Webコンテナ起動

    ```
    docker-compose up
    ```

    もし、デーモンで起動する場合は、 `-d` オプションを追加して実行します。

    ```
    docker-compose up -d
    ```

  * `gem` を追加インストール

    ```
    docker-compose build
    # or
    docker-compose run --rm web bundle install
    ```

  * テストを実行

    ```
    docker-compose run --rm web rspec
    ```

* ...

2018/12/20 10:00
omniatuth_facebook導入
次　→ SSL/HTTPSを有効にする

2018/12/20 11:00
puma導入

2018/12/20 14:30
rais-ujs install

2018/12/21
16:00
foods 対 points through: :food_points実装
