{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/WebPlatformForEmbedded/libwpe/archive/refs/tags/1.14.0.tar.gz
sha:0e9288d6e8cc120f0b395dac697b6df206d44109b5c286c5abaaa698777dc839
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/mesa/egl
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
mv libwpe.a libwpe-1.0.a
{% endblock %}

{% block patch %}
sed -e 's|.*pragma.*poison.*||' -i src/alloc-private.h

base64 -d << EOF > src/loader.c
{% include 'loader.c/base64' %}
EOF
{% endblock %}
