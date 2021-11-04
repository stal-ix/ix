{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://git.kernel.org/pub/scm/libs/libcap/libcap.git/snapshot/libcap-cap/v1.2.59.tar.gz
5fd93353891d721402c84aa1bc4dad77
{% endblock %}

{% block lib_deps %}
lib/linux/mix.sh
{% endblock %}

{% block bld_deps %}
dev/build/make/mix.sh
env/std/mix.sh
{% endblock %}

{% block postunpack %}
cd v*/libcap
{% endblock %}

{% block make_flags %}
SHARED=no
LIBDIR=${out}/lib
{% endblock %}
