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


video_id = 0

$ ->
  #これ書けばajaxが動く。でも現状GETが追加で一回多く発生してる。
  $("a[data-update]")
    .on "ajax:success", (data, status, xhr) ->
      $($(@).attr("data-update")).html status
  


  setTimeout ->
    defaultPost = parseInt($("#post-detail").attr("default"))
    if defaultPost > 0
      myApp.popup('<div id="post-detail" class="popup popup-about">' + $("#post-detail").html() + '</div>')
      page.setPost defaultPost
  , 1000

  $("body").on "click", ".post", ->
    page.setPost $(@).attr("post")

  $("body").on "click", ".video-post", ->
    video_id = $(@).attr("video-id")
    $(".status-bar").show()
    $(".youtube").html('<iframe width="100%" height="200" src="//www.youtube.com/embed/' + $(@).attr("youtube-id") + '" frameborder="0" allowfullscreen></iframe>')
