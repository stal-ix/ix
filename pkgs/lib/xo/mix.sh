{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://github.com/Juniper/libxo/archive/refs/tags/1.6.0.tar.gz
6d29d5ca45cb469b9ccd3bb962dbee5a
{% endblock %}

{% block lib_deps %}
lib/c
{% if target.os == 'linux' %}
lib/bsd
{% endif %}
{% endblock %}

{% block bld_libs %}
{% if target.os == 'linux' %}
lib/bsd/overlay
{% endif %}
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block autoreconf %}
sh bin/setup.sh
{% endblock %}
