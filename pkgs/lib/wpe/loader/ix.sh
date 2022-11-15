{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/WebPlatformForEmbedded/libwpe/archive/refs/tags/1.12.3.tar.gz
sha:40bb2d69acba76076ead4b880b684e26230abf095959e3e7fc2e2864dc5a32e4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/opengl
lib/xkbcommon
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/wpe-1.0 \${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
cp libwpe-1.0.so libwpe-1.0.a
{% endblock %}

{% block patch %}
sed -e 's|.*pragma.*poison.*||' -i src/alloc-private.h

base64 -d << EOF > src/loader.c
{% include 'loader.c/base64' %}
EOF
{% endblock %}
