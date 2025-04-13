{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtsvg
{% endblock %}

{% block version %}
6.6.0
{% endblock %}

{% block fetch %}
https://github.com/qt/qtsvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:4fd6b4d9307c3cd8fd207e60334823fed07a9acb32f7d53cd9c9be9b6a2f8a30
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
