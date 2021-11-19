{% extends '//mix/template/std.sh' %}

{% block fetch %}
https://github.com/kovidgoyal/kitty/archive/refs/tags/v0.23.1.tar.gz
0ca3c5cbc172d3ac7ce63041a4074bb9
{% endblock %}

{% block bld_libs %}
lib/python/mix.sh
lib/lcms2/mix.sh
lib/png/mix.sh
lib/harfbuzz/mix.sh
lib/darwin/framework/IOKit/mix.sh
lib/darwin/framework/Cocoa/mix.sh
lib/darwin/framework/AppKit/mix.sh
lib/darwin/framework/CoreText/mix.sh
lib/darwin/framework/CoreGraphics/mix.sh
lib/darwin/framework/UserNotifications/mix.sh
{% endblock %}

{% block bld_tool %}
dev/build/pkg-config/mix.sh
{% endblock %}

{% block setup %}
export CFLAGS="-w ${CFLAGS}"
{% endblock %}

{% block build %}
python3 ./setup.py build
{% endblock %}
