{% extends '//mix/template/autorehell.sh' %}

{% block fetch %}
https://pm-utils.freedesktop.org/releases/pm-utils-1.4.1.tar.gz
sha:8ed899032866d88b2933a1d34cc75e8ae42dcde20e1cc21836baaae3d4370c0b
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}
