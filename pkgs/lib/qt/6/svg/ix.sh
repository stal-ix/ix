{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtsvg/archive/refs/tags/v6.4.3.tar.gz
sha:3cc7479f7787a19e7af8923547dfc35b7b3fd658e3701577e76b2c1e4c1c0c23
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
