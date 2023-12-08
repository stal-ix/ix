{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/kspalaiologos/bzip3/archive/refs/tags/1.4.0.tar.gz
sha:d70334c19c7cce2cc6c823566b7d8968ff08a52043d518f55caebd2e407b2233
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
