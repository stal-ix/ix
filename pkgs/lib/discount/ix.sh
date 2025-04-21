{% extends '//die/c/make.sh' %}

{% block pkg_name %}
discount
{% endblock %}

{% block version %}
2.2.7d
{% endblock %}

{% block fetch %}
https://www.pell.portland.or.us/~orc/Code/discount/discount-{{self.version().strip()}}.tar.bz2
sha:12a2041e96ae8cde17e08ff1a215d331580a5c58688daa5a18842b6bb5b77b52
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
