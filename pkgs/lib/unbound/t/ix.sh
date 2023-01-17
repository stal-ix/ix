{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-1.17.1.tar.gz
sha:458c2a3f758b38da7ec64a55fd866a8f6c17c07c3736065e0fc4be731a10c3af
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
