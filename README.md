# Hubot Slack Hohho Utilities

This script add some scripts and util

## Adding to Your Hubot

1. `npm install hubot-slack-hohho-utils --save`
2. Open the `external-scripts.json` file in the root directory (you may need to create this file) and add an entry to the array (e.g. `[ 'hubot-slack-hohho-utils' ]`).

## Commands

- `slack say <hogehoge>` - Bot speaks to Random Group
- `slack repeat <hogehoge>` - Bot repeats to the Group

## Utils

- `getUsers` - Get All Users
- `getUserId` - Get user.id from user.name
- `imageMe` - Same as default image me command
- `sacrifice` - hohho-

#### Example

`robot.util.getUserId('hoge')`