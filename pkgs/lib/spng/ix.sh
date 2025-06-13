{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libspng
{% endblock %}

{% block version %}
0.7.4
{% endblock %}

{% block fetch %}
https://github.com/randy408/libspng/archive/refs/tags/v{{self.version().strip()}}.tar.gz
47ec02be6c0a6323044600a9221b049f63e1953faf816903e7383d4dc4234487
{% endblock %}

{% block lib_deps %}
lib/c
lib/z
{% endblock %}
