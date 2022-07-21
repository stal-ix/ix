{% extends '//die/c/make.sh' %}

{% block fetch %}
https://www.kernel.org/pub/software/utils/pciutils/pciutils-3.8.0.tar.xz
sha:91edbd0429a84705c9ad156d4ff38ccc724d41ea54c4c5b88e38e996f8a34f05
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/linux
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
