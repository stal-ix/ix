{% extends '//lib/ng/http/2/t/ix.sh' %}

{% block configure_flags %}
{{super()}}
--enable-lib-only
{% endblock %}

{% block env %}
export COFLAGS="--with-nghttp2=${out} --with-libnghttp2=${out} \${COFLAGS}"
{% endblock %}
