# [github-action-ghr](https://github.com/fnkr/github-action-ghr)

GitHub Action to upload build artifacts to GitHub releases using [ghr](https://github.com/tcnksm/ghr).
The action will trigger on pushes to tags and exit neutrally otherwise.

## Secrets

- `GITHUB_TOKEN` — **Required.** Grants access to the repository.

## Variables

- `GHR_PATH` — **Required.**
Path to the artifacts you want to upload.
You can specify a file or a directory.
If you provide a directory, all files in that directory will be uploaded.

- `GHR_COMPRESS` — **Optional.**
Compress files before uploading them.
Can be either `gz`, `bz2` or `xz`.
The correct file extension will be appended (e.g. `.tar.gz`).

## Usage example

```hcl
workflow "Build and release on push" {
  on = "push"
  resolves = ["Build", "Release"]
}

action "Build" {
  uses = "./"
}

action "Release" {
  uses = "fnkr/github-action-ghr@v1"
  needs = ["Build"]
  secrets = ["GITHUB_TOKEN"]
  env = {
    GHR_PATH = "build/"
    GHR_COMPRESS = "xz"
  }
}
```
