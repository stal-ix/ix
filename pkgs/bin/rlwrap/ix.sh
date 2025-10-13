{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
rlwrap
{% endblock %}

{% block version %}
0.47.1
{% endblock %}

{% block fetch %}
https://github.com/hanslub42/rlwrap/archive/refs/tags/v{{self.version().strip()}}.tar.gz
944bc0e4812e61b2b7c4cd17b1b37b41325deffa0b84192aff8c0eace1a5da4c
{% endblock %}

{% block bld_libs %}
lib/c
lib/pty/tty
lib/readline
{% endblock %}
