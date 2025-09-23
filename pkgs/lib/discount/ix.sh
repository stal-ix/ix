{% extends '//die/c/make.sh' %}

{% block pkg_name %}
discount
{% endblock %}

{% block version %}
3.0.1.2
{% endblock %}

{% block fetch %}
https://github.com/Orc/discount/archive/refs/tags/v{{self.version().strip()}}.tar.gz
4ea6cc8782c6508b3051c469ed7a1b6ca20b023c2a0c26ccd9c83bc7e61dfc16
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
