{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
cairomm
{% endblock %}

{% block version %}
1.18.0
{% endblock %}

{% block fetch %}
https://www.cairographics.org/releases/cairomm-{{self.version().strip()}}.tar.xz
b81255394e3ea8e8aa887276d22afa8985fc8daef60692eb2407d23049f03cfb
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/cairo
lib/sigc++/3
{% endblock %}
