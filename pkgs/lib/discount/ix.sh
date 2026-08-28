{% extends '//die/c/make.sh' %}

{% block pkg_name %}
discount
{% endblock %}

{% block version %}
3.0.1.3
{% endblock %}

{% block fetch %}
https://github.com/Orc/discount/archive/refs/tags/v{{self.version().strip()}}.tar.gz
ec04f366cd0a5036598c6a0bf4f7f2582d8ff04b31e81121314b8fde6db6899d
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
