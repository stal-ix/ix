{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtsvg/archive/refs/tags/v6.5.3.tar.gz
sha:fb8e5574c2480aab78062fad2d0a521633b4591ada600130b918b703c2ddb09a
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}

{% block env %}
{{super()}}
export QT_PATH="${out}:\${QT_PATH}"
export CPPFLAGS="-I${out}/include/QtSvg \${CPPFLAGS}"
{% endblock %}
