{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-1.19.2.tar.gz
sha:4bd21d08a14f87f3fbc20e60407de35f3f53f4ba7b1cbcf11cbfc0b8115d0bef
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
