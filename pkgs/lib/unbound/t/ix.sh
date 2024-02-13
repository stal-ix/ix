{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-1.19.1.tar.gz
sha:cc1231e6756c9ec88fadf8425f7302f8884ca8781fb108275f2ad476c284edd8
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
lib/openssl
{% endblock %}

{% block bld_tool %}
bld/flex
bld/bison
{% endblock %}
