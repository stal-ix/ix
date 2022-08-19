{% extends '//die/c/make.sh' %}

{% block fetch %}
https://github.com/rui314/mold/archive/refs/tags/v1.4.1.tar.gz
sha:394036d299c50f936ff77ce9c6cf44a5b24bfcabf65ae7db9679f89c11a70b3f
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
rm -r third-party/tbb
rm -r third-party/xxhash
rm -r third-party/mimalloc

sed -e 's|.*mimalloc-new.*||' -i main.cc
sed -e 's|-lcrypto||' -i Makefile
sed -e 's|/usr/bin/python3|/usr/bin/env python3|' -i update-git-hash.py

find . -type f | while read l; do
    sed -e 's|-lmimalloc||g' \
        -e 's|xxhash/xxhash.h|xxhash.h|' \
        -e 's|third-party/xxhash.h|xxhash.h|' \
        -i ${l}
done
{% endblock %}

{% block build %}
{{super()}}
>mold-wrapper.so
{% endblock %}
