{% extends '//die/autorehell.sh' %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-1.16.0.tar.gz
sha:926e78bf266d2b2275e050469cee4bdfc0e6ee407dccffaf5892fc0282819a7d
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
