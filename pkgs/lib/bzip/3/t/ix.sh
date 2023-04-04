{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/kspalaiologos/bzip3/archive/refs/tags/1.3.0.tar.gz
sha:155e2e22fab0559f60e8a9896bb8ec1813bf47e352bf3184c79a041e8da114dd
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
