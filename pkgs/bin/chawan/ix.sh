{% extends '//die/nim/base.sh' %}

{% block pkg_name %}chawan{% endblock %}
{% block version %}
0.5.2
{% endblock %}

{% block fetch %}
https://git.sr.ht/~bptato/chawan/archive/v{{self.version().strip()}}.tar.gz
21201936aa3a5ff0117fd55bfa1805ab77647761f4341fd2f77eca15bb66c807
{% endblock %}

{% block bld_tool %}
bld/make
bld/pkg/config
{% endblock %}

{% block bld_libs %}
lib/c
lib/kernel
lib/openssl
lib/brotli
lib/ssh/2/openssl
{% endblock %}

{% block host_libs %}
lib/c
{% endblock %}

{% block patch %}
sed -e '/chac_cache/s|$(NIMC)|$(NIMH)|' -i Makefile
{% endblock %}

{% block build %}
make -j${make_thrs} NIMC=nimcc NIMH=nimhost STATIC_LINK=1
{% endblock %}

{% block install %}
make install PREFIX=${out}
{% endblock %}
