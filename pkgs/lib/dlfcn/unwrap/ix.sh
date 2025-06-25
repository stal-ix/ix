{% extends '//lib/dlfcn/t/ix.sh' %}

{% block fetch %}
https://github.com/pg83/dlopen/archive/refs/tags/v2.tar.gz
a868469f93379c5b89c7e8906f5f896f0b80bbc55032238954f0b38a9a55206d
{% endblock %}

{% block patch %}
sed -e 's|-std=c++20|-std=c++17|' -i Makefile
{% endblock %}
