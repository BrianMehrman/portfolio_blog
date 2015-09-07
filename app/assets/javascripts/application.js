// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//#= require jquery-ui
//= require codemirror
//= require codemirror/modes/javascript
//= require codemirror/modes/htmlmixed
//= require codemirror/modes/xml
//= require codemirror/modes/css
//= require react
//= require react_ujs
//= require components
//= require_tree .

removeSection = function(e){
  e.preventDefault();
  things_to_show = $(this).attr('data-show');
  $(this).parent().remove();
  if(typeof(things_to_show) != 'undefined') { $(things_to_show).show(); };
}

ieHover = function() {
	var sfEls = document.getElementById("nav").getElementsByTagName("LI");
	for (var i=0; i<sfEls.length; i++) {
		sfEls[i].onmouseover=function() {
			this.className+=" iehover";
		}
		sfEls[i].onmouseout=function() {
			this.className=this.className.replace(new RegExp(" iehover\\b"), "");
		}
	}
}

var rotateToTime = function(el) {
  // rotate element to match the time
  elms = $(el);

  elms.each(function(){
    time = new Date( Date.parse($(this).attr('data-post-date')) );

    d = (time.getHours() * 60  + time.getMinutes()) / (60 * 24) * 360;
    // midnight is 0 deg / noon is 180 deg
    var a = "-webkit-transform: rotate("+d+"deg); -moz-transform: rotate("+d+"deg); -ms-transform: rotate("+d+"deg); -o-transform: rotate("+d+"deg); transform: rotate("+d+"deg);";
    $(this).find('div').attr("style", a);
  });

}

if (window.attachEvent) window.attachEvent("onload", sfHover);

$(document).ready(function($) {
  $('.js-remove').click(removeSection);
  rotateToTime('.rotate-to-date');


})


getForm = function ( element )
{
  while( element )
  {
    element = element.parentNode
    if( element.tagName.toLowerCase() == "form" )
    {
      return element
    }
  }
  return 0; //error: no form found in ancestors
}


$(function(){ $(document).foundation(); });
