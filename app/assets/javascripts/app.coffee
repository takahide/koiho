previous_url = ""

$ ->
  #これ書けばajaxが動く。でも現状GETが追加で一回多く発生してる。
  $(document).on "ajax:success", "a[data-update]", (data, status, xhr) ->
      $($(@).attr("data-update")).html status

  $(document).on "click", ".video-post", ->
    previous_url = location.href
    youtube_id = $(@).attr("youtube-id")
    $(".status-bar").show()
    $(".youtube").html('<iframe width="100%" height="200" src="//www.youtube.com/embed/' + youtube_id + '" frameborder="0" allowfullscreen></iframe>')
    window.history.pushState(null, null, "/v/#{youtube_id}");

  $(document).on "click", ".koiho", ->
    $(".color-red").removeClass("color-red").addClass("color-gray").addClass("open-popup").text("こいほー済み").removeAttr("data-remote").removeAttr("data-method").removeAttr("href")


  $(document).on "click ", ".close-popup", ->
    username = $(".nav-title").text().split("@")[1] || ""
    window.history.pushState(null, null, "/#{username}");
