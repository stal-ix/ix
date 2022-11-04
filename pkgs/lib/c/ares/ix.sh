{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
CARES_BUILD_TOOLS=OFF
{% endblock %}

{% block env %}
export COFLAGS="--with-ares=${out} --enable-ares=${out} \${COFLAGS}"
export LDFLAGS="-lresolv \${LDFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|^exec_prefix.*||' -i ${out}/lib/pkgconfig/libcares.pc
{% endblock %}
