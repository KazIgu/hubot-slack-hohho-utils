require './Util.coffee'
module.exports = (robot) ->
  mention = (name) ->
    return "<@#{robot.util.getUserId(name)}>"

  robot.respond /repeat(.+)/, (msg) ->
    text =  msg.message.text
    trigger = msg.match[0].replace msg.match[1], ''
    message = text.replace trigger, ''
    mentionNames = message.match(/\@[^(\@|\s|:)]+/g)
    console.log mentionNames
    if mentionNames
      for target, i in mentionNames
        mentionName = mention target.replace(/:|@|\s/g, '')
        message = message.replace target, "#{mentionName}"
    msg.send message
