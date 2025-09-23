{% extends '//die/c/meson.sh' %}

{% block pkg_name %}
inih
{% endblock %}

{% block version %}
62
{% endblock %}

{% block fetch %}
https://github.com/benhoyt/inih/archive/refs/tags/r{{self.version().strip()}}.tar.gz
9c15fa751bb8093d042dae1b9f125eb45198c32c6704cd5481ccde460d4f8151
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
