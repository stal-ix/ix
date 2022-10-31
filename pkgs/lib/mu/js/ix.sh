{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/ccxvii/mujs/archive/refs/tags/1.3.1.tar.gz
sha:fc784d71bfa3f2c33f91412a9f22e356cdc4f9d34d9beeba46c34543a40f52b8
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
