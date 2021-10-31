{% extends '//mix/template/make.sh' %}

{% block fetch %}
# url https://git.kernel.org/pub/scm/libs/libcap/libcap.git/snapshot/libcap-cap/v1.2.59.tar.gz
# md5 5fd93353891d721402c84aa1bc4dad77
{% endblock %}

{% block deps %}
# lib lib/linux/package.sh
# bld dev/build/make/package.sh
# bld env/std/package.sh
{% endblock %}

{% block postunpack %}
cd v*/libcap
{% endblock %}

{% block make_flags %}
SHARED=no
LIBDIR=${out}/lib
{% endblock %}
