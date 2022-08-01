{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/WebPlatformForEmbedded/libwpe/archive/refs/tags/1.12.2.tar.gz
sha:2e6581057825b26f03fa024b6db450364a10fe9ea3c5b0e220384c3ec2410fa3
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
cp libwpe-1.0.so libwpe-1.0.a
{% endblock %}

{% block patch %}
sed -e 's|.*pragma.*poison.*||' -i src/alloc-private.h

base64 -d << EOF > src/loader.c
{% include 'loader.c/base64' %}
EOF
{% endblock %}
