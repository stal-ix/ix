{% extends '//die/c/autohell.sh' %}

{% block pkg_name %}
nmap
{% endblock %}

{% block version %}
7.991
{% endblock %}

{% block fetch %}
https://nmap.org/dist/nmap-{{self.version().strip()}}.tar.bz2
a5d507f29437bef3bedd4771ff9aaa8fc1c2a109ddba1f5b1cf12027456929be
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/ssh/2
lib/kernel
lib/pcre/2
lib/linear
lib/openssl
{% endblock %}
