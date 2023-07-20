{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtsvg/archive/refs/tags/v6.5.2.tar.gz
sha:2d0c8780f164472ad968bb4eff325a86b2826f101efedbeca5662acdc0b294ba
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
