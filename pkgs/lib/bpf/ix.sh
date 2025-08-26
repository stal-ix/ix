{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libbpf
{% endblock %}

{% block version %}
1.6.2
{% endblock %}

{% block fetch %}
https://github.com/libbpf/libbpf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
16f31349c70764cba8e0fad3725cc9f52f6cf952554326aa0229daaa21ef4fbd
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
