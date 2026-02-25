{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libbpf
{% endblock %}

{% block version %}
1.6.3
{% endblock %}

{% block fetch %}
https://github.com/libbpf/libbpf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
989ed3c1a3db8ff0f7c08dd43953c6b9d0c3ac252653a48d566aaedf98bc80ca
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
