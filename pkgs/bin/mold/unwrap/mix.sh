{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/rui314/mold/archive/refs/tags/v1.2.1.tar.gz
sha:41868663ff18afee3fa35e5e3fdf3d9575eb2e4ff49967b8f42f479c61c1ec34
{% endblock %}

{% block bld_libs %}
lib/z
lib/c
lib/c++
lib/xxhash
lib/openssl
lib/intel/tbb
{% endblock %}

{% block std_box %}
bld/python
bld/pkg/config
{{super()}}
{% endblock %}

{% block make_flags %}
SYSTEM_TBB=1
SYSTEM_XXHASH=1
SYSTEM_MIMALLOC=1
{% endblock %}

{% block make_target %}
mold
{% endblock %}

{% block patch %}
rm -r third-party
sed -e 's|.*mimalloc-new.*||' -i main.cc
sed -e 's|-lcrypto||' -i Makefile
{% endblock %}

{% block build %}
{{super()}}
>mold-wrapper.so
{% endblock %}
