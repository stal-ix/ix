{% extends '//die/nim/base.sh' %}

{% block pkg_name %}chawan{% endblock %}
{% block version %}
0.5.1
{% endblock %}

{% block fetch %}
https://git.sr.ht/~bptato/chawan/archive/v{{self.version().strip()}}.tar.gz
67a54f10acd2dcda6c62bca825ccaf228f94d04ba9dc85c9369930c58d12ec21
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
