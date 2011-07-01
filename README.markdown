Lokka +1 Button
===============

This is a [Lokka](http://lokka.org) plugin to add ["+1 Button"](http://www.google.com/+1/button/) link.

Installation
------------

Run these commands:

    $ cd public/plugin
    $ git clone git://github.com/nkmrshn/lokka-plusone.git

Usage
-----

You can set options in the admin page [Plugins]->[Pluseone].

There are two helper methods.

One is "plusone_js" to output JavaScript for +1 button.

    <script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>

Antoher is "plusone" and it will output g:plusone(DOM) or div(HTML5) tag.

    <g:plusone size="medium" count="false" lang="ja"></g:plusone>
    <div class="g-plusone" data-size="medium" data-count="false" data-lang="ja"></div>
