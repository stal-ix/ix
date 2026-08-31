{% extends '//die/c/make.sh' %}

{% block pkg_name %}
discount
{% endblock %}

{% block version %}
3.0.2.0
{% endblock %}

{% block fetch %}
https://github.com/Orc/discount/archive/refs/tags/v{{self.version().strip()}}.tar.gz
99f6db36d3fff6c99acd21d4c6096176d4ac8785eab319d0faf77ad995b8b7c5
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
