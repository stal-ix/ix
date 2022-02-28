{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/rui314/mold/archive/refs/tags/v1.1.tar.gz
sha:2f04bb2cd58797258c4f5f6f29fd2667f8b6c6b2bc76c731fede526884ea9a0c
{% endblock %}

{% block bld_libs %}
lib/z
lib/c
lib/c++
lib/xxhash
lib/openssl
lib/intel/tbb
{% endblock %}

{% block bld_tool %}
bin/gzip
bin/pkg-config
{% endblock %}

{% block make_flags %}
SYSTEM_MIMALLOC=1
SYSTEM_XXHASH=1
SYSTEM_TBB=1
{% endblock %}

{% block make_target %}
mold
{% endblock %}

{% block patch %}
rm -r third-party

(find . -name '*.h'; find . -name '*.cc') | while read l; do
    sed -e 's|PAGE_SIZE|MOLD_PAGE_SIZE|g' -i ${l}
done

sed -e 's|.*mimalloc-new.*||' -i main.cc
{% endblock %}

{% block build %}
{{super()}}
>mold-wrapper.so
{% endblock %}
