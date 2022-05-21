{% extends '//die/make.sh' %}

{% block fetch %}
https://mujs.com/downloads/mujs-1.2.0.tar.xz
sha:66976d1e06a352754a2342af73d1aecbb53cc7cdae2b68cda013b7ddcf923233
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block make_flags %}
HAVE_READLINE=no
{% endblock %}

{% block make_target %}
static
{% endblock %}

{% block make_install_target %}
install-static
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Version:.*|Version: 1.2.0|' -i ${out}/lib/pkgconfig/mujs.pc
{% endblock %}
