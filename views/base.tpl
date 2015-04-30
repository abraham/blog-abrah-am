<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <meta name="theme-color" content="#039be5">
        <link rel="icon" sizes="192x192" href="https://abrah.am/img/logo-192.jpg">

        <title>{{title}}</title>

        <link rel="shortcut icon" href="https://abrah.am/favicon.ico">
        <link type="text/plain" rel="author" href="https://abrah.am/humans.txt" />
        <link rel='me' href='https://plus.google.com/+abrahamwilliams' />
        <link rel='author' href='https://plus.google.com/+abrahamwilliams' />

        <link rel="dns-prefetch" href="https://cdnjs.cloudflare.com/">
        <link rel="dns-prefetch" href="https://apis.google.com/">
        <link rel="dns-prefetch" href="https://1.bp.blogspot.com/">
        <link rel="dns-prefetch" href="https://2.bp.blogspot.com/">
        <link rel="dns-prefetch" href="https://3.bp.blogspot.com/">
        <link rel="dns-prefetch" href="https://4.bp.blogspot.com/">
        <link rel="dns-prefetch" href="https://accounts.google.com/">
        <link rel="dns-prefetch" href="https://ssl.gstatic.com/">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/css/materialize.min.css">
        <style type="text/css">
            #posts {
                margin-top: 15px;
                min-height: 400px;
            }

            .card {
                cursor: pointer;
            }

            .card-image .card-title {
                width: 100%;
                background-color: rgba(13, 13, 13, 0.4);
            }

            .post-gplus {
                margin-top: 5px;
            }

            .header {
                color: #039be5;
                font-weight: 300;
            }

            .parallax-container {
                height: 400px;
            }

            .main {
                min-height: 400px;
            }

            .nothing {
                min-height: 400px;
            }

            .nothing h5 {
                width: 100%;
            }
        </style>

    </head>

    <body>
        <div class="navbar-fixedx">
        <nav class="light-blue darken-1" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="/" class="brand-logo center">Blog</a>
                <ul class="right hide-on-small-only">
                    <li><a href="https://abrah.am">Abraham Williams</a></li>
                </ul>

                <ul id="nav-mobile" class="side-nav">
                    <li><a href="/">Blog</a></li>
                    <li><a href="https://abrah.am">Abraham Williams</a></li>
                    % if defined('sidebar'):
                        <li class="divider"></li>
                        % for link in sidebar:
                            <li><a href="{{sidebar[link]['href']}}">{{sidebar[link]['text']}}</a></li>
                        % end
                    % end
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="mdi-navigation-menu"></i></a>
            </div>
        </nav>
        </div>

        <div class="main">
            {{!base}}
        </div>

        <footer class="page-footer light-blue darken-1">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12">
                        <h5 class="white-text">Abraham Williams</h5>
                        <p class="grey-text text-lighten-4">When not dashing out code at <a href="http://bendyworks.com" class="white-text">Bendyworks</a>, this professional bearder can usually be found baking fresh bread or in the boxing ring. Currently residing in Madison, WI, consuming deep fried cheese curds and enjoying Midwestern hospitality.</p>
                    </div>
                    <div class="col l4 offset-l2 s12">
                        <h5 class="white-text">Links</h5>
                        <ul>
                            <li><a class="grey-text text-lighten-3" href="https://abrah.am">Homepage</a></li>
                            <li><a class="grey-text text-lighten-3" href="https://plus.google.com/+AbrahamWilliams">Google+</a></li>
                            <li><a class="grey-text text-lighten-3" href="https://github.com/abraham">GitHub</a></li>
                            <li><a class="grey-text text-lighten-3" href="https://twitter.com/abraham">Twitter</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-copyright light-blue darken-1">
                <div class="container">
                    The blog of Abraham Williams
                </div>
            </div>
        </footer>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.isotope/2.2.0/isotope.pkgd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/js/materialize.min.js"></script>
        <script src="https://apis.google.com/js/platform.js" async defer></script>

        <script>
            // TODO: move to file
            var $container;
            var debounce = function (func, threshold, execAsap) {
                  var timeout;

                  return function debounced () {
                      var obj = this, args = arguments;
                      function delayed () {
                          if (!execAsap)
                              func.apply(obj, args);
                          timeout = null;
                      }

                      if (timeout)
                          clearTimeout(timeout);
                      else if (execAsap)
                          func.apply(obj, args);

                      timeout = setTimeout(delayed, threshold || 100);
                  };
            };
            function layout() {
                $container.isotope('layout');
            }
            $(document).ready(function(){
                $(".button-collapse").sideNav();
                $container = $('.masonry');
                $container.isotope({
                    itemSelector: '.post',
                    layoutMode: 'masonry'
                });
                $('.card').click(function() {
                    window.location = $(this).closest('.post').data('url');
                });
                $("img").bind('load', debounce(layout));
                $('.parallax').parallax();
            });
        </script>
    </body>
</html>
