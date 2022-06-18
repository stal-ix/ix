{% extends '//die/make.sh' %}

{% block fetch %}
https://github.com/rui314/mold/archive/refs/tags/v1.3.0.tar.gz
sha:02132ae717d7f22f8bc7e5c22642ad41541ec4c535fa85f095c60ecc81465a3d
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

find . -type f | while read l; do
    sed -e 's|-lmimalloc||g' -i ${l}
done
{% endblock %}

{% block build %}
{{super()}}
>mold-wrapper.so
{% endblock %}
