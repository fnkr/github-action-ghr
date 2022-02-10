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
  Can be either `gz`, `bz2`, `xz`, or `zip`.
  The correct file extension will be appended (e.g. `.tar.gz`, or `.zip`).

- `GHR_DELETE` — **Optional.**
  Delete release and its git tag in advance if it exists.
  Can be either `true` or `false`

- `GHR_REPLACE` — **Optional.**
  Replace artifacts if it is already uploaded.
  Can be either `true` or `false`

- `GHR_PARALLELISM` — **Optional.**
  Set amount of parallelism

## Usage example

### YAML

```yaml
on: push
name: Build and release on push
jobs:
  release:
    name: Release
    runs-on: ubuntu-latest
    steps:
      - name: Release
        uses: fnkr/github-action-ghr@v1
        if: startsWith(github.ref, 'refs/tags/')
        env:
          GHR_COMPRESS: xz
          GHR_PATH: build/
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
