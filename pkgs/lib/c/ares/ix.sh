{% extends 't/ix.sh' %}

{% block cmake_flags %}
{{super()}}
CARES_BUILD_TOOLS=OFF
{% endblock %}

{% block env %}
export CPPFLAGS="-DCARES_STATICLIB=1 \${CPPFLAGS}"
export COFLAGS="--with-ares=${out} --enable-ares=${out} \${COFLAGS}"
{% if darwin %}
export LDFLAGS="-lresolv \${LDFLAGS}"
{% endif %}
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|^exec_prefix.*||' -i ${out}/lib/pkgconfig/libcares.pc
{% endblock %}
