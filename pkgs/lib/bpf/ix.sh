{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/libbpf/libbpf/archive/refs/tags/v1.4.4.tar.gz
sha:b4fe864ed96cf276e3370a4706bafbafde1eccd5894418c4d8eeb941f371eb8a
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
