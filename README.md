# download-gh-release-asset

GitHub action that downloads an asset with a given name from the current release, specific release_tag or even specific repository.

This is particulary usefull as a way to host large files for test setup - https://help.github.com/en/github/managing-large-files/distributing-large-binaries 

## Environment
Requires setting `env.GITHUB_TOKEN` with `secrets.GITHUB_TOKEN` (on any other custom token).
By default `secrets.GITHUB_TOKEN` is already set by Github with a token for the current repository.

## Inputs
### file
Required filename to download

### repository
Repository to download from, if not given, it'll default to the current repository
Setting it to a different repository requires a custom `GITHUB_TOKEN` to be set.

### release_tag
Release tag to download the file from, if not give it'll default to the latest release

## Usage

Downloads asset named `asset-file-name.txt` from release assets into working directory with the same name.
```
name: "Fetch release asset"
on: [release]

jobs:
  asset_fetcher:
    runs-on: ubuntu-latest
    steps:
    - uses: wyozi/download-gh-release-asset@master
      with:
        args: release_asset.dat
      env:
        GITHUB_TOKEN: "${{ secrets.GITHUB_TOKEN }}"
```

Downloads asset named `asset-file-name.txt` from `v1` release into working directory with the same name.
```
name: "Fetch asset"
on: [push]
jobs:
  asset_fetcher:
    runs-on: ubuntu-latest
    steps:
    - uses: wyozi/download-gh-release-asset@master
      with:
        file: asset-file-name.txt
        release_tag: v1
      env:
        GITHUB_TOKEN: "${{ secrets.GITHUB_TOKEN }}"
```

Download multiple assets from from `v1` release, in repository `otherRepo`, into working directory with the same name, using `CUSTOM_GITHUB_TOKEN` with permissions to that repository
```
name: "Run tests"
on: [push]
jobs:
  build:
    strategy:
      matrix:
        testFile: [test1, test2]
    runs-on: ubuntu-latest
    steps:
    - uses: wyozi/download-gh-release-asset@master
      with:
        file: "${{ matrix.testFile }}.zip"
        repository: otherRepo
        release_tag: v1
      env:
        GITHUB_TOKEN: "${{ secrets.CUSTOM_GITHUB_TOKEN }}"
      run: |
        echo "## Running ${{ matrix.testFile }} ##"
        unzip "${{ matrix.testFile }}.zip"
        ls -al
```

## Credits

- https://gist.github.com/maxim/6e15aa45ba010ab030c4
- https://github.com/JasonEtco/upload-to-release
