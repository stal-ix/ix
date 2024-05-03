{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/libbpf/libbpf/archive/refs/tags/v1.4.1.tar.gz
sha:cc01a3a05d25e5978c20be7656f14eb8b6fcb120bb1c7e8041e497814fc273cb
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
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block make_install_target %}
install
install_headers
{% endblock %}
