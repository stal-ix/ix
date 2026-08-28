{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libseccomp
{% endblock %}

{% block version %}
2.6.1
{% endblock %}

{% block fetch %}
https://github.com/seccomp/libseccomp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
f9a13e4c633d319a9240189760ca348caa0837c0ebe2a09b17061da8ceaf60f0
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
