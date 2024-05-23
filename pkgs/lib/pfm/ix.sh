{% extends '//die/c/make.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/perfmon2/libpfm4/libpfm-4.13.0.tar.gz
sha:d18b97764c755528c1051d376e33545d0eb60c6ebf85680436813fa5b04cc3d1
{% endblock %}

{% block unpack %}
{{super()}}
cd lib
{% endblock %}

{% block make_flags %}
SYS=Linux
ARCH={{target.arch}}
CONFIG_PFMLIB_SHARED=n
{% endblock %}

{% block lib_deps %}
lib/c
lib/kernel
{% endblock %}

{% block build_flags %}
no_werror
{% endblock %}

{% block install %}
{{super()}}
cp -R ../include ${out}/
{% endblock %}
