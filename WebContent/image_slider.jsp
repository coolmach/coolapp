
<style>
	thumbnail_Normal{border:0px;}
	thumbnail_Focused{border:1px solid orange;}
</style>

 <style>
                /* jssor slider thumbnail navigator skin 11 css */
                /*
                .jssort11 .p            (normal)
                .jssort11 .p:hover      (normal mouseover)
                .jssort11 .pav          (active)
                .jssort11 .pav:hover    (active mouseover)
                .jssort11 .pdn          (mousedown)
                */
                .jssort11
                {
                	font-family: Arial, Helvetica, sans-serif;
                }
                .jssort11 .i, .jssort11 .pav:hover .i
                {
                	position: absolute;
                	top:3px;
                	left:3px;
                	WIDTH: 60px;
                	HEIGHT: 30px;
                	border: white 1px dashed;
                }
                * html .jssort11 .i
                {
                	WIDTH /**/: 62px;
                	HEIGHT /**/: 32px;
                }
                .jssort11 .pav .i
                {
                	border: white 1px solid;
                }
                .jssort11 .t, .jssort11 .pav:hover .t
                {
                	position: absolute;
                	top: 3px;
                	left: 68px;
                	width:129px;
                	height: 32px;
                	line-height:32px;
                	text-align: center;
                	color:#fc9835;
                	font-size:13px;
                	font-weight:700;
                }
                .jssort11 .pav .t, .jssort11 .phv .t, .jssort11 .p:hover .t
                {
                	color:#fff;
                }
                .jssort11 .c, .jssort11 .pav:hover .c
                {
                	position: absolute;
                	top: 38px;
                	left: 3px;
                	width:197px;
                	height: 31px;
                	line-height:31px;
                	color:#fff;
                	font-size:11px;
                	font-weight:400;
                	overflow: hidden;
                }
                .jssort11 .pav .c, .jssort11 .phv .c, .jssort11 .p:hover .c
                {
                	color:#fc9835;
                }
                .jssort11 .t, .jssort11 .c
                {
                	transition: color 2s;
                    -moz-transition: color 2s;
                    -webkit-transition: color 2s;
                    -o-transition: color 2s;
                }
                .jssort11 .p:hover .t, .jssort11 .phv .t, .jssort11 .pav:hover .t, .jssort11 .p:hover .c, .jssort11 .phv .c, .jssort11 .pav:hover .c
                {
                	transition: none;
                    -moz-transition: none;
                    -webkit-transition: none;
                    -o-transition: none;
                }
                .jssort11 .p
                {
                	background:#181818;
                }
                .jssort11 .pav, .jssort11 .pdn
                {
                	background:#462300;
                }
                .jssort11 .p:hover, .jssort11 .phv, .jssort11 .pav:hover
                {
                	background:#333;
                }
            </style>


    <!-- use jssor.slider.min.js instead for release -->
    <!-- jssor.slider.min.js = (jssor.core.js + jssor.utils.js + jssor.slider.js) -->
    <script type="text/javascript" src="./thirdparty/jssor.core.js"></script>
    <script type="text/javascript" src="./thirdparty/jssor.utils.min.js"></script>
    <script type="text/javascript" src="./thirdparty/jssor.slider.min.js"></script>
	<script type="text/javascript" src="./js/jquery-1.9.1.min.js"></script>
    <script>
        jssor_slider1_starter = function (containerId) {
            var options = {
                $AutoPlay: false,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlaySteps: 1,                                  //[Optional] Steps to go for each navigation request (this options applys only when slideshow disabled), the default value is 1
                $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                               //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideDuration: 500,                                //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
                $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
                //$SlideWidth: 600,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
                //$SlideHeight: 300,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
                $SlideSpacing: 5, 					                //[Optional] Space between each slide in pixels, default value is 0
                $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
                $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
                $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
                $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
                $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

                $ThumbnailNavigatorOptions: {
                    $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always

                    $Loop: 2,                                       //[Optional] Enable loop(circular) of carousel or not, 0: stop, 1: loop, 2 rewind, default value is 1
                    $AutoCenter: 3,                                 //[Optional] Auto center thumbnail items in the thumbnail navigator container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 3
                    $Lanes: 1,                                      //[Optional] Specify lanes to arrange thumbnails, default value is 1
                    $SpacingX: 4,                                   //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
                    $SpacingY: 4,                                   //[Optional] Vertical space between each thumbnail in pixel, default value is 0
                    $DisplayPieces: 4,                              //[Optional] Number of pieces to display, default value is 1
                    $ParkingPosition: 0,                            //[Optional] The offset position to park thumbnail
                    $Orientation: 2,                                //[Optional] Orientation to arrange thumbnails, 1 horizental, 2 vertical, default value is 1
                    $DisableDrag: false                             //[Optional] Disable drag or not, default value is false
                }
            };

            var jssor_slider1 = new $JssorSlider$(containerId, options);

            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
                if (parentWidth) {
                    var sliderWidth = parentWidth;

                    //keep the slider width no more than 810
                    sliderWidth = Math.min(sliderWidth, 500);

                    jssor_slider1.$SetScaleWidth(sliderWidth);
                }
                else
                    $JssorUtils$.$Delay(ScaleSlider, 30);
            }

            ScaleSlider();
            $JssorUtils$.$AddEvent(window, "load", ScaleSlider);


            if (!navigator.userAgent.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
                $JssorUtils$.$OnWindowResize(window, ScaleSlider);
            }

            //if (navigator.userAgent.match(/(iPhone|iPod|iPad)/)) {
            //    $JssorUtils$.$AddEvent(window, "orientationchange", ScaleSlider);
            //}
            //responsive code end
        };
    </script>
	<script>
		function highlight(i){
			$(".thumbnail").each(function(index){
				$(this).css("border", "0px");
			});
			$(".thumbnailav").css("border", "0px");
			$(i).css("border", "2px solid orange");
		}
	</script>
    <!-- Jssor Slider Begin -->
    <!-- You can move inline styles to css file or css block. -->
    <div id="slider1_container" style="position: relative; top: 0px; left: 0px; width: 349px; height: 200px;overflow: hidden;">
        
        <!-- Slides Container -->
        <div u="slides" style="cursor:pointer; position:absolute; left:0px; top:0px; width:274px; height:206px; overflow: hidden;">
            <div>
                <img width="200" height="175" id="thumbnail_1" u="image" src="./images/dummy/1.jpeg" />
            </div>
            <div>
                <img width="200" height="175" id="thumbnail_2" u="image" src="./images/dummy/2.jpeg" />
            </div>
            <div>
                <img width="200" height="175" id="thumbnail_3" u="image" src="./images/dummy/3.jpeg" />
            </div>
            <div>
                <img width="275" height="175" id="thumbnail_4" u="image" src="./images/dummy/4.jpeg" />
            </div>
        </div>
        
        <!-- ThumbnailNavigator Skin Begin -->
        <div u="thumbnavigator" class="jssort11" style="position: absolute; width: 100px; height: 200px; left:260px; top:0px;">
            <!-- Thumbnail Item Skin Begin -->
            <div u="slides" style="cursor:pointer;">
                <div u="prototype" onclick="highlight(this)" class="p thumbnail" style="position: absolute; width: 50px; height: 40px; top: 0; left: 0; padding:10x;">
                    <thumbnailtemplate style=" width: 40px; height: 30px; border: none;position:absolute; top: 0; left: 0;"></thumbnailtemplate>
                </div>
            </div>
            <!-- Thumbnail Item Skin End -->
        </div>
        <!-- ThumbnailNavigator Skin End -->
        <a style="display: none" href="http://www.jssor.com">responsive carousel</a>
        <!-- Trigger -->
        <script>
            jssor_slider1_starter('slider1_container');
        </script>
    </div>


