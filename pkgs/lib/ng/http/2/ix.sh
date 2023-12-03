{% extends '//lib/ng/http/2/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--enable-lib-only
{% endblock %}

{% block cpp_defines %}
{{super()}}
NGHTTP2_STATICLIB=1
{% endblock %}

{% block env %}
{{super()}}
export CPPFLAGS="-DNGHTTP2_STATICLIB=1 \${CPPFLAGS}"
export COFLAGS="--with-nghttp2=${out} --with-libnghttp2=${out} \${COFLAGS}"
{% endblock %}
