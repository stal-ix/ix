{% extends '//lib/c++/19/ix.sh' %}

{% block fetch %}
{{super()}}
https://github.com/llvm/llvm-project/commit/e9f851de24baefd5710c3cac6ef3cafaea0eeb9d.diff
sha:4ac449da0572330877a6f54e402bd7dce73fee0e8bc0d27adebb9a82e01aad8e
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
