{% extends '//die/c/ix.sh' %}

{% block pkg_name %}
jail
{% endblock %}

{% block version %}
7e71152
{% endblock %}

{% block fetch %}
https://github.com/pg83/jail/archive/7e71152ca3168f85e589e47198c994aadf7a8bc2.tar.gz
a5d86d63ddfacba3f45caa5da650ca6718d7e75386b54b1f9d6ee9b5f296d6e8
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
{% endblock %}

{% block build %}
cc -o jail jail.c
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp jail ${out}/bin/
{% endblock %}
