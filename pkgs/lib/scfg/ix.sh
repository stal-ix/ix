{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
libscfg
{% endblock %}

{% block version %}
0.1.1
{% endblock %}

{% block fetch %}
https://codeberg.org/emersion/libscfg/archive/v{{self.version().strip()}}.tar.gz
851f889985e89637db430409431e63db5e0a150f1a9e18a4f4ccf1e6612c5915
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
