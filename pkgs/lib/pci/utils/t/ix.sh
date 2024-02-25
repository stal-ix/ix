{% extends '//die/c/make.sh' %}

{% block fetch %}
https://mirrors.edge.kernel.org/pub/software/utils/pciutils/pciutils-3.11.1.tar.xz
sha:3f472ad864473de5ba17f765cc96ef5f33e1b730918d3adda6f945a2a9290df4
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
