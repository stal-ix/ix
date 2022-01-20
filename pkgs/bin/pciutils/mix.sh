{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://www.kernel.org/pub/software/utils/pciutils/pciutils-3.7.0.tar.xz
sha:9d40b97be8b6a2cdf96aead5a61881d1f7e4e0da9544a9bac4fba1ae9dcd40eb
{% endblock %}

{% block bld_libs %}
lib/c
lib/linux
{% endblock %}

{% block make_flags %}
SHAREDIR="${out}/share/hwdata"
SBINDIR="${out}/bin"
SHARED=no
{% endblock %}

{% block make_install_target %}
install
install-lib
{% endblock %}
