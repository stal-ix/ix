{% extends '//lib/c++/19/ix.sh' %}

{% block fetch %}
{{super()}}
https://github.com/llvm/llvm-project/commit/e9f851de24baefd5710c3cac6ef3cafaea0eeb9d.diff
sha:7e2396d96befa0ba92988feb103f0f61a98dba46d5b525d7b73a9a92169805d2
{% endblock %}

{% block patch %}
{{super()}}
patch -p1 < ${src}/e9f851de24baefd5710c3cac6ef3cafaea0eeb9d.diff
{% endblock %}

{% block install %}
{{super()}}
base64 -d << EOF > ${out}/include/__string/fix.h
{% include '0.diff/base64' %}
EOF
sed -e 's|_LIBCPP_END_NAMESPACE_STD|#include "fix.h"|' \
    -i ${out}/include/__string/char_traits.h
{% endblock %}
