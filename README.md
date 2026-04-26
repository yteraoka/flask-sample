# flask-sample

シンプルな Flask アプリケーションの Docker コンテナ化サンプルです。

## 概要

`/` エンドポイントにアクセスすると、バージョン番号とホスト名を返す最小構成の Flask アプリです。

```
Hello World! (Version: 0.7) [<hostname>]
```

## ファイル構成

```
.
├── app/
│   ├── app.py           # Flask アプリケーション本体
│   └── requirements.txt # Python 依存パッケージ
├── Dockerfile           # コンテナイメージ定義
└── .github/workflows/
    ├── build.yaml                  # PR 時: lint・ビルド・セキュリティスキャン
    └── build-and-push-image.yaml   # タグ push 時: GHCR へイメージを公開
```

## 依存パッケージ

| パッケージ | バージョン |
|---|---|
| Flask | 3.0.3 |
| Werkzeug | 3.0.3 |
| Jinja2 | 3.1.4 |
| click | 8.1.7 |
| itsdangerous | 2.2.0 |
| MarkupSafe | 2.1.3 |

## ローカル実行

```bash
pip install -r app/requirements.txt
FLASK_APP=app/app.py flask run
```

## Docker でのビルドと起動

```bash
docker build -t flask-sample .
docker run -p 5000:5000 flask-sample
```

アクセス確認:

```bash
curl http://localhost:5000/
```

## コンテナイメージ

GitHub Container Registry (GHCR) で公開されています。

```
ghcr.io/yteraoka/flask-sample:<tag>
```

`v` プレフィックスのタグ (例: `v1.0.0`) を push すると自動的にビルド・公開されます。

## CI/CD

| ワークフロー | トリガー | 内容 |
|---|---|---|
| Build and scan | Pull Request | Dockerfile lint (hadolint)、イメージビルド、Dockle・Trivy によるセキュリティスキャン |
| Build and push | `v*` タグ push | GHCR へのイメージビルドおよび公開 |

## ライセンス

[LICENSE](LICENSE) を参照してください。
