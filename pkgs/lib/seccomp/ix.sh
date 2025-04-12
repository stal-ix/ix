{% extends '//die/c/autorehell.sh' %}

{% block version %}
2.6.0
{% endblock %}

{% block fetch %}
https://github.com/seccomp/libseccomp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:0889a8da98e37f86019c90789fd4ff7eda6e1ceb9ef07d4c51c67aeb50a77860
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
