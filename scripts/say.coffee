module.exports = (robot) ->

  mention = (name) ->
    return "<@#{robot.util.getUserId(name)}>"

  robot.respond /say(.+)/, (msg) ->
    text =  msg.message.text
    trigger = msg.match[0].replace msg.match[1], ''
    message = text.replace trigger, ''
    mentionNames = message.match(/\@[^(\@|\s|:)]+/g)
    if mentionNames
      for target, i in mentionNames
        mentionName = mention target.replace(/:|@|\s/g, '')
        message = message.replace target, "#{mentionName}"
    robot.send { room: 'random' }, message

