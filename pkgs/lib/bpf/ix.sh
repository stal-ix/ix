{% extends '//die/c/make.sh' %}

{% block pkg_name %}
libbpf
{% endblock %}

{% block version %}
1.5.0
{% endblock %}

{% block fetch %}
https://github.com/libbpf/libbpf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:53492aff6dd47e4da04ef5e672d753b9743848bdb38e9d90eafbe190b7983c44
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
