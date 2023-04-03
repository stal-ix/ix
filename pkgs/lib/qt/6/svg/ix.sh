{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtsvg/archive/refs/tags/v6.5.0.tar.gz
sha:2f96e22858de18de02b05eb6bcc96fadb6d77f4dadd407e1fa4aebcceb6dd154
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
