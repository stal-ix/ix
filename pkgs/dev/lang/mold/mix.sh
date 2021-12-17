{% extends '//mix/template/make.sh' %}

{% block fetch %}
https://github.com/rui314/mold/archive/733bb6354f9913a9fba599f1779620286f1e2e4c.zip
042509fb0e9ed63ec730d41d732c4ca4
{% endblock %}

{% block bld_libs %}
lib/z/mix.sh
lib/c/mix.sh
lib/c++/mix.sh
lib/xxhash/mix.sh
lib/intel/tbb/mix.sh
lib/openssl/mix.sh
{% endblock %}

{% block bld_tool %}
lib/z/mix.sh
{% endblock %}

{% block make_flags %}
SYSTEM_MIMALLOC=1
SYSTEM_TBB=1
{% endblock %}

{% block make_target %}
mold
{% endblock %}

{% block patch %}
rm -r third-party

(

    find . | grep '\.h$'
    find . | grep '\.cc$'
) | while read l; do
    sed -e 's|PAGE_SIZE|MOLD_PAGE_SIZE|g' -i ${l}
done
{% endblock %}

{% block build %}
{{super()}}
>mold-wrapper.so
{% endblock %}
