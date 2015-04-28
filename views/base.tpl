<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/css/materialize.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <meta name="theme-color" content="#039be5">
        <link rel="icon" sizes="192x192" href="https://abrah.am/img/logo-192.jpg">

        <link rel="shortcut icon" href="https://abrah.am/favicon.ico">
        <link type="text/plain" rel="author" href="https://abrah.am/humans.txt" />
        <link rel='me' href='https://plus.google.com/+abrahamwilliams' />
        <link rel='author' href='https://plus.google.com/+abrahamwilliams' />


        <title>{{title}}</title>

        <style type="text/css">
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
        </style>
    </head>

    <body>
        <nav class="light-blue lighten-1" role="navigation">
            <div class="nav-wrapper container">
                <a id="logo-container" href="/" class="brand-logo">Blog</a>
                <ul class="right hide-on-med-and-down">
                    <li><a href="https://abrah.am">Abraham Williams</a></li>
                </ul>

                <!-- <ul id="nav-mobile" class="side-nav">
                    <li><a href="https://abrah.am">Abraham Williams</a></li>
                </ul>
                <a href="#" data-activates="nav-mobile" class="button-collapse"><i class="mdi-navigation-menu"></i></a> -->
            </div>
          </nav>

        <div class='containerx'>
            {{!base}}
        </div>

        <footer class="page-footer light-blue darken-1">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12">
                        <h5 class="white-text">Abraham Williams</h5>
                        <p class="grey-text text-lighten-4">When not dashing out code at Addvocate, this professional bearder can usually be found baking fresh bread or in the boxing ring. Currently living in the Bay Area but it's even-keeled weather doesn't live up to the Maine crisp coast and snow-capped fir trees.</p>
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
            $(".button-collapse").sideNav();
            var $container = $('.masonry');
            $container.isotope({
                itemSelector: '.post',
                layoutMode: 'masonry'
            });
            $('.card').click(function() {
                window.location = $(this).closest('.post').data('url');
            });
        </script>
    </body>
</html>
