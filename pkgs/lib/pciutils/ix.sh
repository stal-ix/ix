{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/pciutils/pciutils/archive/refs/tags/v3.9.0.tar.gz
sha:17829b1fc3ef2a022f2b0a6c4d7a686b53a2fb0233951c31f9344e0abc4034bf
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
