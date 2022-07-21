{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.3.1.tar.gz
sha:50ab72838ed8eacd0aad5eda06b410ebd0e3dcc3e610fe0bed99f7d3fe912458
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
