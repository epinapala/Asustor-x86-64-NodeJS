# Node.js for ASUSTOR NAS x64

Node.js ASUSTOR application package file for 64bit CPU architecture.

## How to use

### Download Node.js

Get the linux-x64 build from the [Node.js Unofficial Builds Project](https://unofficial-builds.nodejs.org/). Navigate to [download page](https://unofficial-builds.nodejs.org/download/release/) and download the version of your choice. You can check the target version in [index.tab](https://unofficial-builds.nodejs.org/download/release/index.tab)

```console
curl -LO https://unofficial-builds.nodejs.org/download/release/v14.17.6/node-v14.17.6-linux-x64-usdt.tar.gz
```

### Unarchive Node.js

Extract the downloaded archive and move it under `./src/`.

```console
tar -xvf node-v14.17.6-linux-x64-usdt.tar.gz
mv node-v14.17.6-linux-x64-usdt/* ./src/
```

### Copy `libstdc++.so.6`

Pull the image of `amd64/buildpack-deps` to get the `libstdc ++. So.6` shared library file from the container. At this time, mount `./install` on the host side to` / install` on the container to extract the files onto the host machine. Note that we are doing all this on the NAS itself.
Note: If you get permission denied error, run docker commands as sudo!

```console
docker pull amd64/buildpack-deps
docker run -it --rm -v ${PWD}/install:/install amd64/buildpack-deps cp -a /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.28 /install
```


The extracted file will be moved under `./src/lib64/`.

```console
mv install/* ./src/CONTROL/lib64/
```

### Build the .apk

Create a package file from the `./src/` directory with the following command.

```console
python ./APKG_Utilities_2.0/apkg-tools.py create ./src
```

### Install .apk

Log in to the ASUSTOR NAS administration screen and open App Central.

Install the package from the Manual Install tab under Management.

## References

- [ASUSTOR Developer Corner / Tools](https://developer.asustor.com/)
  - App Central Developer Guide
  - App Build Tools
  - Sample Custom apk

## Credits
- [Node.js for ASUSTOR NAS i386 by c18t](https://github.com/c18t/asustor-nas-app-nodejs-i386)

## License

- Source: [MIT](LICENSE)
- Icon: [iconfinder.com : Long shadow web icons icons by the more](https://www.iconfinder.com/icons/308444/javascrpt_js_library_long_shadow_nodejs_web_icon)
