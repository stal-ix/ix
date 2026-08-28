{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libbpf
{% endblock %}

{% block version %}
1.7.0
{% endblock %}

{% block fetch %}
https://github.com/libbpf/libbpf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
7ab5feffbf78557f626f2e3e3204788528394494715a30fc2070fcddc2051b7b
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
