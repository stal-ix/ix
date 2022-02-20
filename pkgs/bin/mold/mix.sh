{% extends '//mix/make.sh' %}

{% block fetch %}
https://github.com/rui314/mold/archive/refs/tags/v1.0.3.tar.gz
sha:488c12058b4c7c77bff94c6f919e40b2f12c304214e2e0d7d4833c21167837c0
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
{% endblock %}

{% block build %}
{{super()}}
>mold-wrapper.so
{% endblock %}
