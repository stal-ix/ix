{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/dlbeer/quirc/archive/refs/tags/v1.2.tar.gz
sha:73c12ea33d337ec38fb81218c7674f57dba7ec0570bddd5c7f7a977c0deb64c5
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_tool %}
bld/fake(tool_name=pkg-config)
{% endblock %}

{% block make_target %}
libquirc.a
{% endblock %}

{% block install %}
mkdir ${out}/lib ${out}/include
cp lib/quirc.h ${out}/include/
cp libquirc.a ${out}/lib/
{% endblock %}
