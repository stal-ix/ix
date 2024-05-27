{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/libbpf/libbpf/archive/refs/tags/v1.4.2.tar.gz
sha:cfa2b6fbafab9608a2ab90d0eaf64f05c27dbf76d81bed516385e825f1aad502
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
