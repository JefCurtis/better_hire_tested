$ ->
  $("navbar-link-alt").on "click", "a", (e) -> 
    $(this).parent("li").addClass("active").siblings().removeClass "active"
    # e.preventDefault()

$ ->
  $("#sign-in").next().hide()

$ ->
  $("#sign-in").on "click", "a", (e) ->
    e.preventDefault()
    $(this).fadeOut(20, ->
      $('#hidden-field').animate( 
        { width: "toggle", duration: 200 }, 500, ->
          $("#hidden-field").show()
      )
    )