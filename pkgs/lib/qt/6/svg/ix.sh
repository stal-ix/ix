{% extends '//die/c/qt.sh' %}

{% block pkg_name %}
qtsvg
{% endblock %}

{% block version %}
6.12.0
{% endblock %}

{% block fetch %}
https://github.com/qt/qtsvg/archive/refs/tags/v{{self.version().strip()}}.tar.gz
38d440c4e97c90ce4f5b76c65dcd63d716d2ef4852baa6fb0926fb94bb96ea66
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
