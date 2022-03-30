{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/stevegrubb/libcap-ng/archive/refs/tags/v0.8.3.tar.gz
sha:e542e9139961f0915ab5878427890cdc7762949fbe216bd0cb4ceedb309bb854
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}
