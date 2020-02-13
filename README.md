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

- `GHR_TITLE` — **Optional.**
  Set release title.

- `GHR_TITLE_FILE` — **Optional.**
  Set path to file that contains release title.

- `GHR_BODY` — **Optional.**
  Set release description.

- `GHR_BODY_FILE` — **Optional.**
  Set path to file that contains release description.

- `GHR_REPLACE` — **Optional.**
  Replace artifacts if already present.

- `GHR_DRAFT` — **Optional.**
  Release as draft (unpublish).

- `GHR_PRERELEASE` — **Optional.**
  Release as pre-release.

- `GHR_REPOSITORY` - **Optional.**
  Release to another repository.
  Note: `${{ secrets.GITHUB_TOKEN }}` only grants access to the current repository.
  If you're releasing to another repository, you'll need to use a personal access token with `repo` scope.

## Usage

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
