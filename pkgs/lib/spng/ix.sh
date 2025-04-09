{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/randy408/libspng/archive/refs/tags/v0.7.4.tar.gz
sha:47ec02be6c0a6323044600a9221b049f63e1953faf816903e7383d4dc4234487
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}
