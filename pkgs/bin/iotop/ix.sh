{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/Tomas-M/iotop/archive/refs/tags/v1.22.tar.gz
sha:
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}
