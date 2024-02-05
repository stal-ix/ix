{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/numactl/numactl/archive/refs/tags/v2.0.17.tar.gz
sha:af22829cda8b5bdee3d280e61291697bbd3f9bd372afdf119c9348b88369d40b
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block patch %}
rm autogen.sh
{% endblock %}
