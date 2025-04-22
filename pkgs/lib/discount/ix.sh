{% extends '//die/c/make.sh' %}

{% block pkg_name %}
discount
{% endblock %}

{% block version %}
3.0.0d
{% endblock %}

{% block fetch %}
https://github.com/Orc/discount/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:0ed8cc27ac5d46dc6a8beedd5e5673ac8b466a6474bdb7d35f37c815f670385f
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
