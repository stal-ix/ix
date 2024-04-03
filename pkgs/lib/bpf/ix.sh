{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/libbpf/libbpf/archive/refs/tags/v1.4.0.tar.gz
sha:4271dfd51f59d23c03d9ae62d8a92622af0f5216a620a7a666c4975c3c7cda6e
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
