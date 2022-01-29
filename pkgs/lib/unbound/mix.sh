{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-1.13.2.tar.gz
2538f5d0ee98f26d82df45d13893771f
{% endblock %}

{% block lib_deps %}
lib/c
lib/expat
lib/openssl
{% endblock %}

{% block bld_tool %}
bin/flex
bin/bison/3/7
{% endblock %}

{% block configure_flags %}
--with-libunbound-only
{% endblock %}
