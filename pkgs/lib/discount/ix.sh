{% extends '//die/c/make.sh' %}

{% block pkg_name %}
discount
{% endblock %}

{% block version %}
3.0.1
{% endblock %}

{% block fetch %}
https://github.com/Orc/discount/archive/refs/tags/v{{self.version().strip()}}.tar.gz
045fe1b57e44bbc47cecf9611861178449c999fe22921252ae80f0dddd517687
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure %}
export AC_PATH=${PATH}
sh ./configure.sh \
    --prefix=${out} \
    --enable-all-features
{% endblock %}

{% block make_install_target %}
install.everything
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block setup_target_flags %}
export CFLAGS="-Wno-incompatible-function-pointer-types ${CFLAGS}"
{% endblock %}
