{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.5.2.tar.gz
sha:a606569022ecc20a175873f239634a6d2fcdcb313d3e4fe711fac7a658e87355
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
