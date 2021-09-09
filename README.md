# Node.js for ASUSTOR NAS i386

IA-32(x86) CPU アーキテクチャ向けの Node.js ASUSTOR アプリケーションパッケージファイル。

## How to use

### Download Node.js

[Node.js Unofficial Builds Project](https://unofficial-builds.nodejs.org/) の [ダウンロードページ](https://unofficial-builds.nodejs.org/download/release/) から、linux-x86 ビルドの URL を取得し、ダウンロードします。対象バージョンは [index.tab](https://unofficial-builds.nodejs.org/download/release/index.tab) で確認できます。

```console
curl -LO https://unofficial-builds.nodejs.org/download/release/v12.16.3/node-v12.16.3-linux-x86.tar.xz
```

### Unarchive Node.js

ダウンロードしたアーカイブを展開し、`./src/`配下に移動します。

```console
tar -Jxvf node-v12.16.3-linux-x86.tar.xz
mv node-v12.16.3-linux-x86/* ./src/
```

### Copy `libstdc++.so.6`

`i386/buildpack-deps`のイメージを pull してコンテナの`libstdc++.so.6`ファイルを取り出します。このとき、ホスト側の`./install`をコンテナの`/install`にマウントします。

```console
docker pull i386/buildpack-deps
docker run -it --rm -v $(PWD)/install:/install i386/buildpack-deps cp -a /usr/lib/i386-linux-gnu/libstdc++.so.6.0.25 /install
```

#### For amd64

```console
docker pull amd64/buildpack-deps
docker run -it --rm -v $(PWD)/install:/install amd64/buildpack-deps cp -a /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.25 /install
```


取り出したファイルは `./src/lib/` 配下に移動します。

```console
mv install/* ./src/CONTROL/lib/
```

### Build .apk

以下のコマンドでパッケージファイルを作成します。

```console
python2 ./APKG_Utilities_2.0/apkg-tools.py create ./src
```

### Install .apk

ASUSTOR NAS の管理画面にログインし、App Central を開きます。

管理の手動インストールタブからパッケージをインストールします。

## References

- [ASUSTOR Developer Corner / Tools](https://developer.asustor.com/)
  - App Central Developer Guide
  - App Build Tools
  - Sample Custom apk

## License

- Source: [MIT](LICENSE)
- Icon: [iconfinder.com : Long shadow web icons icons by the more](https://www.iconfinder.com/icons/308444/javascrpt_js_library_long_shadow_nodejs_web_icon)
