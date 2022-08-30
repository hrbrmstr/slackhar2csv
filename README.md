# slackhar2csv

Turns a HAR file saved from Developer Tools' "Network" tab — after scrolling history in a Slack channel — to a CSV of timestamped channel messages.

## Dependencies

Requires [jq](https://stedolan.github.io/jq/).

## Usage

```bash
./slackhar2csv.sh <JSON_INPUT_FILE> <CSV_OUTPUT_FILE>
```

Longer blather on how to create the HAR file:

- Be in a browser (Chromium ones work best for this) tab with a target Slack channel and at the most recent channel history
- Open "Developer Tools"
- Reload the tab
- Scroll back as far as you want to collect message history
- From the "Network" tab in Developer Tools, save all as HAR

## Limitations

No attempt is made to expand Slack handle identifiers to the bot or human they represent
