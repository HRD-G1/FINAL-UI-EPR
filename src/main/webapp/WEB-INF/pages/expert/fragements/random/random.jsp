 <style>
        
/*         @media only screen and (max-width: 1000px) {
    body {
        background-color:lightblue;
    }
}
   */      
        
        /* jssor slider bullet navigator skin 03 css */
        /*
        .jssorb03 div           (normal)
        .jssorb03 div:hover     (normal mouseover)
        .jssorb03 .av           (active)
        .jssorb03 .av:hover     (active mouseover)
        .jssorb03 .dn           (mousedown)
        */
        .jssorb03 {
            position: absolute;
        }
        .jssorb03 div, .jssorb03 div:hover, .jssorb03 .av {
            position: absolute;
            /* size of bullet elment */
            width: 21px;
            height: 21px;
            text-align: center;
            line-height: 21px;
            color: white;
            font-size: 12px;
            background: url('${pageContext.request.contextPath}/resources/experts/random/img/b03.png') no-repeat;
            overflow: hidden;
            cursor: pointer;
        }
        .jssorb03 div { background-position: -5px -4px; }
        .jssorb03 div:hover, .jssorb03 .av:hover { background-position: -35px -4px; }
        .jssorb03 .av { background-position: -65px -4px; }
        .jssorb03 .dn, .jssorb03 .dn:hover { background-position: -95px -4px; }

        /* jssor slider arrow navigator skin 03 css */
        /*
        .jssora03l                  (normal)
        .jssora03r                  (normal)
        .jssora03l:hover            (normal mouseover)
        .jssora03r:hover            (normal mouseover)
        .jssora03l.jssora03ldn      (mousedown)
        .jssora03r.jssora03rdn      (mousedown)
        */
        .jssora03l, .jssora03r {
            display: block;
            position: absolute;
            /* size of arrow element */
            width: 55px;
            height: 55px;
            cursor: pointer;
            background: url('${pageContext.request.contextPath}/resources/experts/random/img/a03.png') no-repeat;
            overflow: hidden;
        }
        .jssora03l { background-position: -3px -33px; }
        .jssora03r { background-position: -63px -33px; }
        .jssora03l:hover { background-position: -123px -33px; }
        .jssora03r:hover { background-position: -183px -33px; }
        .jssora03l.jssora03ldn { background-position: -243px -33px; }
        .jssora03r.jssora03rdn { background-position: -303px -33px; }
    </style>
<body style="padding:0px; margin:0px; background-color:#fff;font-family:Arial, sans-serif">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/experts/random/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/experts/random/js/jssor.slider.mini.js"></script>
    <!-- use jssor.slider.debug.js instead for debug -->
    <script>
        jQuery(document).ready(function ($) {
            
            var jssor_1_options = {
              $AutoPlay: true,
              $AutoPlaySteps: 4,
              $SlideDuration: 160,
              $SlideWidth: 200,
              $SlideSpacing: 3,
              $Cols: 4,
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$,
                $Steps: 4
              },
              $BulletNavigatorOptions: {
                $Class: $JssorBulletNavigator$,
                $SpacingX: 1,
                $SpacingY: 1
              }
            };
            
            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);
            
            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizing
            function ScaleSlider() {
                var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
                if (refSize) {
                    refSize = Math.min(refSize, 809);
                    jssor_1_slider.$ScaleWidth(refSize);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }
            ScaleSlider();
            $(window).bind("load", ScaleSlider);
            $(window).bind("resize", ScaleSlider);
            $(window).bind("orientationchange", ScaleSlider);
            //responsive code end
        });
    </script>

    <div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 809px; height: 150px; overflow: hidden; visibility: hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
            <div style="position:absolute;display:block;background:url('${pageContext.request.contextPath}/resources/experts/random/img/loading.gif') no-repeat center center;top:0px;left:0px;width:100%;height:100%;"></div>
        </div>
        <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 809px; height: 150px; overflow: hidden;">
            <div style="display: none;">
            	<a href="/rest/expert/content">
                	<img data-u="image" src="${pageContext.request.contextPath}/resources/experts/img/sal.jpg" />
                </a>
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/img/ly.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/img/tey.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/img/ra.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/img/nang.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/019.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/020.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/021.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/022.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/024.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/025.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/027.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/029.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/030.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/031.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/030.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/034.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/038.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/039.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/043.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/044.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/047.jpg" />
            </div>
            <div style="display: none;">
                <img data-u="image" src="${pageContext.request.contextPath}/resources/experts/random/img/050.jpg" />
            </div>
            <a data-u="add" href="http://www.jssor.com" style="display:none">Jssor Slider</a>
        
        </div>
        <!-- Bullet Navigator -->
        <div data-u="navigator" class="jssorb03" style="bottom:10px;right:10px;">
            <!-- bullet navigator item prototype -->
            <div data-u="prototype" style="width:21px;height:21px;">
                <div data-u="numbertemplate"></div>
            </div>
        </div>
        <!-- Arrow Navigator -->
        <span data-u="arrowleft" class="jssora03l" style="top:0px;left:8px;width:55px;height:55px;" data-autocenter="2"></span>
        <span data-u="arrowright" class="jssora03r" style="top:0px;right:8px;width:55px;height:55px;" data-autocenter="2"></span>
    </div>

    <!-- #endregion Jssor Slider End -->
</body>
