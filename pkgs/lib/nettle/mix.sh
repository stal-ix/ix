{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/nettle/nettle-3.7.3.tar.gz
a60273d0fab9c808646fcf5e9edc2e8f
{% endblock %}

{% block lib_deps %}
lib/gmp/mix.sh
{% endblock %}

{% block bld_tool %}
dev/doc/texinfo/mix.sh
dev/build/autoconf/2/69/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block autoreconf %}
autoreconf -i
{% endblock %}
