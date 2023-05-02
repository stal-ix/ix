{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/pciutils/pciutils/archive/refs/tags/v3.10.0.tar.gz
sha:e579d87f1afe2196db7db648857023f80adb500e8194c4488c8b47f9a238c1c6
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/kernel
{% endblock %}

{% block make_flags %}
# TODO(pg): proper data dir
SHAREDIR="${out}/share/hwdata"
SBINDIR="${out}/bin"
SHARED=no
{% endblock %}

{% block make_install_target %}
install-lib
{% endblock %}
