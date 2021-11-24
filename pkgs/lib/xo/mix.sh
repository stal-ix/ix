{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/Juniper/libxo/archive/refs/tags/1.6.0.tar.gz
6d29d5ca45cb469b9ccd3bb962dbee5a
{% endblock %}

{% block lib_deps %}
{{'lib/bsd/mix.sh' | linux}}
{% endblock %}

{% block bld_libs %}
{{'lib/bsd/overlay/mix.sh' | linux}}
{% endblock %}

{% block bld_tool %}
dev/build/autoconf/2/71/mix.sh
dev/build/automake/1.16.3/mix.sh
{% endblock %}

{% block autoreconf %}
dash bin/setup.sh
{% endblock %}
