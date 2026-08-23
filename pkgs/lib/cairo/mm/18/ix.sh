{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
cairomm
{% endblock %}

{% block version %}
1.18.1
{% endblock %}

{% block fetch %}
https://www.cairographics.org/releases/cairomm-{{self.version().strip()}}.tar.xz
e0e996a979ee52c840dca3ee74f5d005e3259b94ddce58f255d3b6f47c8cb41d
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/cairo
lib/sigc++/3
{% endblock %}
