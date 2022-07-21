{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://mirror.tochlab.net/pub/gnu/help2man/help2man-1.49.2.tar.xz
sha:9e2e0e213a7e0a36244eed6204d902b6504602a578b6ecd15268b1454deadd36
{% endblock %}

{% block bld_tool %}
bld/perl
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
