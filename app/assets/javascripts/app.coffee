class Page
  _post = 1
  setPost: (id) ->
    $(".detail#{_post}").addClass "hidden"
    _post = parseInt id
    $(".status-bar").show()
    setTimeout ->
      $(".detail#{_post}").removeClass "hidden"
    , 1000
  getPost: ->
    return _post

page = new Page()

$ ->
  setTimeout ->
    defaultPost = parseInt($("#post-detail").attr("default"))
    if defaultPost > 0
      myApp.popup('<div id="post-detail" class="popup popup-about">' + $("#post-detail").html() + '</div>')
      page.setPost defaultPost
  , 1000

  $("body").on "click", ".post", ->
    page.setPost $(@).attr("post")

  $("body").on "click", ".video-post", ->
    $(".status-bar").show()
    $(".youtube").html('<iframe width="100%" height="200" src="//www.youtube.com/embed/' + $(@).attr("video-id") + '" frameborder="0" allowfullscreen></iframe>')
