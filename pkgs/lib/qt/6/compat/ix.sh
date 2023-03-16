{% extends '//die/c/qt.sh' %}

{% block fetch %}
https://github.com/qt/qt5compat/archive/refs/tags/v6.4.3.tar.gz
sha:03cc7250359ce577c8ffe4400c79fef987e03d1f259e842e95b769a99dfeb063
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
