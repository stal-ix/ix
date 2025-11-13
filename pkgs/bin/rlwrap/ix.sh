{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
rlwrap
{% endblock %}

{% block version %}
0.48
{% endblock %}

{% block fetch %}
https://github.com/hanslub42/rlwrap/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b2721b1c0147aaafc98e6a31d875316ba032ad336bec7f2a8bc538f9e3c6db60
{% endblock %}

{% block bld_libs %}
lib/c
lib/pty/tty
lib/readline
{% endblock %}
