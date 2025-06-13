{% extends '//die/c/make.sh' %}

{% block pkg_name %}
quirc
{% endblock %}

{% block version %}
1.2
{% endblock %}

{% block fetch %}
https://github.com/dlbeer/quirc/archive/refs/tags/v{{self.version().strip()}}.tar.gz
73c12ea33d337ec38fb81218c7674f57dba7ec0570bddd5c7f7a977c0deb64c5
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
