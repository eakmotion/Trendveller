searchTwitter = (query) ->
  $.ajax
    url: "http://search.twitter.com/search.json?" + jQuery.param(query)
    dataType: "jsonp"
    success: (data) ->
      tweets = $("#tweets")
      tweets.html ""
      for res of data["results"]
        tweets.append "<div>" + data["results"][res]["from_user"] + " wrote: <p>" + data["results"][res]["text"] + "</p></div><br />"

$(document).ready ->
  $("#submit").click ->
    params =
      q: $("#query").val()
      rpp: 20

    # alert(jQuery.param(params));
    searchTwitter params