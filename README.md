# Fixinator Github Action

Audit your CFML security using [Fixinator](https://fixinator.app/) and GitHub Actions.

## Usage

1. Add a `FIXINATOR_KEY` repository secret containing your Fixinator API key
2. Create a `fixinator.yml` (or similarly-named) workflow file
3. Add the following steps to the workflow:

```yml
- uses: actions/checkout@v2
- name: Run Fixinator
  uses: ortus-solutions/fixinator-action@v1
  with:
    api_key: ${{ secrets.FIXINATOR_KEY }}
    path: models,interceptors
    confidence: medium
```

## Arguments

* `api_key` - The Fixinator API key. *Required*.
* `path` - The folder or file to scan. You can also pass a file globber pattern, like `models/**/*.cfc`
* `confidence` - Possible values are `none`, `low`, `medium` or `high`. This setting filters out results that the scanner is not confident about. Setting it to a lower value will show more issues but may have some false positives. Defaults to `high`
* `severity` - Possible values are: `low`, `medium` or `high`. Filter by severity of the issues found. Defaults to `low`
* `autofix` - Possible values are `off` or `auto`. Autofix identified issues. **This action cannot support the `prompt` option**. Defaults to `off`.
* `resultFile` - Writes results to a file specified by the path in resultFile. You may specify a comma separated list of paths if you want to write multiple formats.
* `resultFormat` - Specify a format for the `resultFile`: `json` (default), `html`, `pdf`, `csv`, `junit`, `sast`, or `findbugs`. You may specify a comma separated list of formats and `resultFile` paths if you want to write multiple files.
* `ignorePaths` - A file globber pattern of paths to ignore from the scan.
* `failOnIssues` - Possible values are `true` and `false`. Fail the build when issues are found. Defaults to `true`.

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)

## Code of Conduct

> :book: Do unto others as you would have them do to you - [Matthew 7:12](https://www.biblegateway.com/passage/?search=matthew+7%3A12&version=NIV)