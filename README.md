# download-gh-release-asset

GitHub action that downloads asset with given name from the GitHub release that triggered the action.

## Usage

Downloads asset named `asset-file-name.txt` from release assets into working directory with the same name.

```
action "Fetch asset" {
  uses = "wyozi/download-gh-release-asset@master"
  args = ["asset-file-name.txt"]
  secrets = ["GITHUB_TOKEN"]
}
```

## Credits

- https://gist.github.com/maxim/6e15aa45ba010ab030c4
- https://github.com/JasonEtco/upload-to-release
