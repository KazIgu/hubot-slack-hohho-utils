ensureImageExtension = (url) ->
  ext = url.split('.').pop()
  if /(png|jpe?g|gif)/i.test(ext)
    url
  else
    "#{url}#.png"


Robot = (robot) ->
  Util = {}
  Users = robot.brain.data.users
  delete Users.USLACKBOT

  Util.getUsers = ->
    return Users

  Util.getUserId = (name) ->
    for key of Users
      if name == Users[key].name
        return Users[key].id

  Util.imageMe = (msg, query, animated, faces, cb) ->
    cb = animated if typeof animated == 'function'
    cb = faces if typeof faces == 'function'
    q = v: '1.0', rsz: '8', q: query, safe: 'active'
    q.imgtype = 'animated' if typeof animated is 'boolean' and animated is true
    q.imgtype = 'face' if typeof faces is 'boolean' and faces is true
    msg.http('http://ajax.googleapis.com/ajax/services/search/images')
      .query(q)
      .get() (err, res, body) ->
        images = JSON.parse(body)
        images = images.responseData?.results
        if images?.length > 0
          image = msg.random images
          cb ensureImageExtension image.unescapedUrl

  Util.sacrifice = ->
    sacrifices = []
    for key of Users
      sacrifices.push Users[key].name
    sacrifices[Math.floor Math.random() * sacrifices.length]


  robot.util = Util

module.exports = Robot
