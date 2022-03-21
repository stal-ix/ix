{% extends '//mix/make.sh' %}

{% block fetch %}
https://www.kernel.org/pub/software/utils/pciutils/pciutils-3.7.0.tar.xz
sha:9d40b97be8b6a2cdf96aead5a61881d1f7e4e0da9544a9bac4fba1ae9dcd40eb
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
