{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/WebPlatformForEmbedded/libwpe/archive/b6d3088d085f7ff93465e148904be42688c0d3d9.zip
sha:f6ec62c32e0a242b9aa4e72547346d6409b770240b29fdb6b3246aeeca49dcef
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/mesa/egl
lib/xkbcommon
{% endblock %}

{% block cmake_flags %}
BUILD_SHARED_LIBS=OFF
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/wpe-1.0 \${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
cd ${out}/lib
mv libwpe.a libwpe-1.0.a
{% endblock %}

{% block patch %}
base64 -d << EOF > src/loader-static.c
{% include 'loader.c/base64' %}
EOF
{% endblock %}
