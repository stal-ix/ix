{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
help2man
{% endblock %}

{% block version %}
1.49.3
{% endblock %}

{% block fetch %}
https://mirror.tochlab.net/pub/gnu/help2man/help2man-{{self.version().strip()}}.tar.xz
4d7e4fdef2eca6afe07a2682151cea78781e0a4e8f9622142d9f70c083a2fd4f
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
