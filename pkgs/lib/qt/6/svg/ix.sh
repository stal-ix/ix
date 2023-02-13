{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtsvg/archive/refs/tags/v6.4.2.tar.gz
sha:2f5fa08dbe6f3aea0c1c77acb74b6164dc069e15010103377186902b018fb623
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}

{% block env %}
{{super()}}
export QT_PATH="${out}:\${QT_PATH}"
{% endblock %}
