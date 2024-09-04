{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/libbpf/libbpf/archive/refs/tags/v1.4.6.tar.gz
sha:d4cf3ee697d9bd959ad3c0f5c6757370a2559e54448761271e15a23c31c1082e
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

{% block env %}
export BPF_HEADERS="${out}/include"
{% endblock %}
