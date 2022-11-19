{% extends '//die/c/meson.sh' %}

{% block fetch %}
https://github.com/varlink/libvarlink/archive/refs/tags/23.tar.gz
sha:a5575e070e446e7c4486d424393950e6cb7a3b376ee20d517b0c13a876659a8d
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block step_patch %}
echo 'TODO(pg): disable only meson patching'
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
cp libvarlink.so libvarlink.a
{% endblock %}
