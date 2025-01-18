{% extends '//lib/c++/19/ix.sh' %}

{% block install %}
{{super()}}
base64 -d << EOF > ${out}/include/__string/fix.h
{% include '0.diff/base64' %}
EOF
sed -e 's|_LIBCPP_END_NAMESPACE_STD|#include "fix.h"|' \
    -i ${out}/include/__string/char_traits.h
{% endblock %}
