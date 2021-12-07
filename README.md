# Fixinator Github Action

[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Fixinator_Scan-blue.svg?colorA=24292e&colorB=0366d6&style=flat&longCache=true&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAA4AAAAOCAYAAAAfSC3RAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAM6wAADOsB5dZE0gAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAERSURBVCiRhZG/SsMxFEZPfsVJ61jbxaF0cRQRcRJ9hlYn30IHN/+9iquDCOIsblIrOjqKgy5aKoJQj4O3EEtbPwhJbr6Te28CmdSKeqzeqr0YbfVIrTBKakvtOl5dtTkK+v4HfA9PEyBFCY9AGVgCBLaBp1jPAyfAJ/AAdIEG0dNAiyP7+K1qIfMdonZic6+WJoBJvQlvuwDqcXadUuqPA1NKAlexbRTAIMvMOCjTbMwl1LtI/6KWJ5Q6rT6Ht1MA58AX8Apcqqt5r2qhrgAXQC3CZ6i1+KMd9TRu3MvA3aH/fFPnBodb6oe6HM8+lYHrGdRXW8M9bMZtPXUji69lmf5Cmamq7quNLFZXD9Rq7v0Bpc1o/tp0fisAAAAASUVORK5CYII=)](https://github.com/marketplace/actions/fixinator-scan)

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