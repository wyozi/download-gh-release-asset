# download-gh-release-asset

GitHub action that downloads asset with given name from the GitHub release that triggered the action.

This action only works on the `release` event.

## Usage

Downloads asset named `asset-file-name.txt` from release assets into working directory with the same name.

```
name: "Fetch release asset"
on:
- release

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

## Credits

- https://gist.github.com/maxim/6e15aa45ba010ab030c4
- https://github.com/JasonEtco/upload-to-release
