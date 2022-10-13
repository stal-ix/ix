{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-1.17.0.tar.gz
sha:3f2672b4281f5366cf1dfc184fb3ede415c8aabf6578f6ede1a04cf2ee9fcb9f
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
