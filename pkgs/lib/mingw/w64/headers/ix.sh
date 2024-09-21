{% extends '//lib/mingw/w64/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd mingw-w64-headers
{% endblock %}

{% block configure_flags %}
{{super()}}
--enable-sdk=all
{% endblock %}

{% block install %}
{{super()}}
# conflict with clang19
sed -e 's|void __cpuidex|void __cpuidex_xxx|' \
    -i ${out}/include/psdk_inc/intrin-impl.h
{% endblock %}

{% block env %}
export CPPFLAGS="-isystem${out}/include \${CPPFLAGS}"
{% endblock %}
