{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rui314/mold/archive/refs/tags/v1.3.1.tar.gz
sha:d436e2d4c1619a97aca0e28f26c4e79c0242d10ce24e829c1b43cfbdd196fd77
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
