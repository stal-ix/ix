{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/numactl/numactl/archive/refs/tags/v2.0.16.tar.gz
sha:a35c3bdb3efab5c65927e0de5703227760b1101f5e27ab741d8f32b3d5f0a44c
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
{% endblock %}
