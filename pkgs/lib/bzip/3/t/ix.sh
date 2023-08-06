{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/kspalaiologos/bzip3/archive/refs/tags/1.3.2.tar.gz
sha:4827782c4d31ec8d7763907a29376fdea1515c23a8e98ad9daf93672a8497423
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
