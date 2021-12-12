{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/NLnetLabs/unbound/archive/refs/tags/release-1.13.2.tar.gz
2538f5d0ee98f26d82df45d13893771f
{% endblock %}

{% block lib_deps %}
lib/expat/mix.sh
lib/openssl/mix.sh
{% endblock %}

{% block bld_tool %}
dev/lang/flex/mix.sh
dev/lang/bison/3/7/mix.sh
dev/build/auto/conf/2/69/mix.sh
dev/build/auto/make/1/16/mix.sh
{% endblock %}

{% block configure_flags %}
--with-libunbound-only
{% endblock %}
