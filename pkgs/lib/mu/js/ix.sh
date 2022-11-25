{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/ccxvii/mujs/archive/refs/tags/1.3.2.tar.gz
sha:59763cc32776714b4f00a0efede83f4f56b381c9dbaced4756d665c214249dca
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
