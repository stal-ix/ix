{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rui314/mold/archive/refs/tags/v1.4.0.tar.gz
sha:c255af236e629a3afb0cd89185a3a944741aa55bfbe966eb175af1c7b6097c0b
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
LIBEXECDIR=${out}/bin/{{uniq_id}}
{% endblock %}

{% block make_target %}
mold
{% endblock %}

{% block patch %}
rm -r third-party

>rust-demangle.c

sed -e 's|.*mimalloc-new.*||' -i main.cc
sed -e 's|-lcrypto||' -e 's|third.*demangle.c|rust-demangle.c|' -i Makefile
sed -e 's|.*rust.*demangle.*||' -i demangle.cc

find . -type f | while read l; do
    sed -e 's|-lmimalloc||g' -e 's|xxhash/xxhash.h|xxhash.h|' -i ${l}
done
{% endblock %}

{% block build %}
{{super()}}
>mold-wrapper.so
{% endblock %}
