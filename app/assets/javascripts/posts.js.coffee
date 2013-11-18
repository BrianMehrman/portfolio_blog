# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.getSelected = () ->
    selected = $.map($(".selector input[type='checkbox']:checked"), (s) ->
      $(s).attr("name"))
    selected

window.init_hide_n_show = () ->
  long_text_elm = $(this).find(".long_text")
  short_text_elm = $(this).find(".short_text")
  long_text_elm.hide()
  short_text_elm.show()
  show_link = $("<a href='#' class='show_link'>show</a>")
  short_text_elm.prepend(show_link)
  show_link.click(show_text)
  hide_link = $("<a href='#' class='hide_link'>hide</a>")
  hide_link.click(hide_text)
  long_text_elm.prepend(hide_link)

hide_text = (e)->
  e.preventDefault
  $(this).parent().parent().find(".long_text").slideToggle('fast', ()->
    $(this).parent().parent().find(".short_text").slideToggle('slow'))

show_text = (e)->
  e.preventDefault
  $(this).parent().parent().find(".short_text").slideToggle('fast', ()->
    $(this).parent().parent().find(".long_text").slideToggle('slow'))

convertCanvasToImage = (canvas) ->
  canvas.toDataURL();


grabElement = ->
  html2canvas $("#preview").contents().find("body"),
    onrendered: (canvas) ->
      img = convertCanvasToImage(canvas)
      image_input = $("#post_image")
      image_input.val(img)

      console.log(img)

$ ->
  $('.hide_n_show_text').each(init_hide_n_show)
  $('#attachment_button').hover(()->
    unless $(this).hasClass('open')
      path = $(this).attr('href')
      $.ajax({
        url: path
        type: 'GET'
        dataType: 'script'
        beforeSend:(xhr,settings)->
          $('#attachment_button');
          $("#attachment_index").html('loading').addClass('loading');
        complete:()->
          $('#attachment_index').removeClass('loading')
        error:()->
          $("#attachment_index").html('Error')
        success:(data, status,xhr)->
          $('#attachment_button').addClass('open');
          # $("#attachment_index").html(xhr.responseText)
      })
  )
  $('#attachment_button').bind('mouseleave',()->
    $(this).removeClass('open')
  )
window.attachment_item_init = ()->
  unless $(this).hasClass('showing') == true
    self = this
    path = $(self).attr('data-show-link')
    console.log(path)
    $.ajax({
      url:path
      type: 'GET'
      dataType: 'script'
      beforeSend:(xhr,settings)->
        $('.attachment').removeClass("showing")
        $("#attachment_show_edit").fadeOut(250,()->
          $(this).html('loading').fadeIn(100).addClass('loading');
        );
      complete:()->
        $('#attachment_show_edit').removeClass('loading')
      error:()->
        $("#attachment_show_edit").html('Error')
      success:(data,status,xhr)->
        $(self).addClass("showing")
        # $("#attachment_show_edit").html(xhr.responseText)
    })

window.updateiFrame = (selector, html,css,js) ->
  previewFrame = $(selector)[0];
  preview =  previewFrame.contentDocument || previewFrame.contentWindow.document;
  js_snippet = "\<script\>" + js + "\<\/script\>"
  css_snippet = "<style type='text/css'>" + css + "</style>"
  preview_output = "<!doctype html><html><head><meta charset='utf-8'>" + js_snippet + css_snippet + "</head><body>" + html + "</body></html>"
  preview.open()
  preview.write(preview_output)
  preview.close()
  console.log("here first")
  grabElement()

# Local Mirror is a class the controls the code mirror instance on the posts form.
window.LocalMirror = (h_sel, c_sel, j_sel)->
  delay = 300
  #Initialize CodeMirror editor with a nice html5 canvas demo.
  htmlArea = $(h_sel)[0]
  cssArea = $(c_sel)[0]
  jsArea = $(j_sel)[0]

  htmlEditor = CodeMirror.fromTextArea(htmlArea, {
          mode: 'text/html',
          tabMode: 'indent',
          lineNumbers:true,
          theme:'ambiance',
          lineWrapping:true
  });

  cssEditor = CodeMirror.fromTextArea(cssArea, {
          mode: 'text/html',
          tabMode: 'indent',
          lineNumbers:true,
          theme:'ambiance',
          lineWrapping:true
  });

  jsEditor = CodeMirror.fromTextArea(jsArea, {
          mode: 'js',
          tabMode: 'indent',
          lineNumbers:true,
          theme:'ambiance',
          lineWrapping:true
  });

  updatePreview = () ->
    updateiFrame('#preview', htmlEditor.getValue(),cssEditor.getValue(),jsEditor.getValue())

  $("#update").click(updatePreview);
  setTimeout(updatePreview, 300);
