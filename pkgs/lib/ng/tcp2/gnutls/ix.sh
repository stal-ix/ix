{% extends '//lib/ng/tcp2/t/ix.sh' %}

{% block lib_deps %}
{{super()}}
lib/gnutls
{% endblock %}

{% block cmake_flags %}
{{super()}}
ENABLE_OPENSSL=OFF
ENABLE_GNUTLS=ON
{% endblock %}

{% block patch %}
{{super()}}
>examples/CMakeLists.txt
{% endblock %}

{% block env %}
{{super()}}
export COFLAGS="--with-gnutls --without-openssl \${COFLAGS}"
{% endblock %}
