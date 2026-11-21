{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
libseccomp
{% endblock %}

{% block version %}
2.6.2
{% endblock %}

{% block fetch %}
https://github.com/seccomp/libseccomp/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4e3dfa94dfc4c2aa21e5e707e5bfebc87063f2461b1d22f84e9d1ed507db7e4b
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

{% block c_flags %}
-fPIC
{% endblock %}

{% block conf_ver %}
2/71
{% endblock %}

{% block patch %}
find . -executable -type f | while read l; do
    fix_shebangs ${l}
done
{% endblock %}
