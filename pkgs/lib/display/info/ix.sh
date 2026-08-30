{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libdisplay-info
{% endblock %}

{% block version %}
0.4.0
{% endblock %}

{% block version_sha %}
5b88699ca21dceb10ab8fb1b41d1cbd9eabeb3b775e11e86ce9d7d6a3158a318
{% endblock %}

{% block fetch %}
https://gitlab.freedesktop.org/emersion/libdisplay-info/-/archive/{{self.version().strip()}}/libdisplay-info-{{self.version().strip()}}.tar.bz2
{{self.version_sha().strip()}}
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_data %}
aux/hwdata
{% endblock %}
