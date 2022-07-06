{% extends '//die/qt.sh' %}

{% block fetch %}
https://github.com/qt/qtsvg/archive/refs/tags/v6.3.1.tar.gz
sha:728b348ff8c3e579b0daab47ef17d8ddd7e25369bd81928b127467e23685ee84
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/qt/6/base
{% endblock %}
