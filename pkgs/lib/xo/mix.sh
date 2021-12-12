{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/Juniper/libxo/archive/refs/tags/1.6.0.tar.gz
6d29d5ca45cb469b9ccd3bb962dbee5a
{% endblock %}

{% block lib_deps %}
{% if target.os == 'linux' %}
lib/bsd/mix.sh
{% endif %}
{% endblock %}

{% block bld_libs %}
{% if target.os == 'linux' %}
lib/bsd/overlay/mix.sh
{% endif %}
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/71/mix.sh
dev/build/auto/make/1/16/mix.sh
{% endblock %}

{% block autoreconf %}
dash bin/setup.sh
{% endblock %}
