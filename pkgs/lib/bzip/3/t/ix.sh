{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/kspalaiologos/bzip3/archive/refs/tags/1.3.1.tar.gz
sha:e77ee082f472d2c01b5c3f5de9bbf762712a627d80a7fa1eca65d249df4e8626
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
