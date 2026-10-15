{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libbpf
{% endblock %}

{% block version %}
1.8.0
{% endblock %}

{% block fetch %}
https://github.com/libbpf/libbpf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
b7a1e685f90f6a63ead0dd85d053694b222975da8d09c1a966041cff6f0055ff
{% endblock %}

{% block lib_deps %}
lib/c
lib/elfutils
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block step_unpack %}
{{super()}}
cd src
{% endblock %}

{% block bld_tool %}
bld/pkg/config
{% endblock %}

{% block make_flags %}
LIBSUBDIR=lib
BUILD_STATIC_ONLY=1
{% endblock %}

{% block env %}
export BPF_HEADERS="${out}/include"
{% endblock %}
