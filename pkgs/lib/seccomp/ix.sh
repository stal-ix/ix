{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/seccomp/libseccomp/archive/refs/tags/v2.5.5.tar.gz
sha:7082b016d3cbda3e15c0e71ebd018023d693bb7507389b32f943db13f935e01d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block bld_tool %}
bld/bash
bin/gperf
bld/shebangs
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block patch %}
find . -executable -type f | while read l; do
    fix_shebangs ${l}
done
{% endblock %}
