{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/numactl/numactl/archive/refs/tags/v2.0.15.tar.gz
sha:1508bb02f56f1b9376243980ba96291856ba083e7a3480fdcb0fbf11ff01d6fa
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}
