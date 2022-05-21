{% extends '//die/cmake.sh' %}

{% block fetch %}
https://github.com/uclouvain/openjpeg/archive/refs/tags/v2.5.0.tar.gz
sha:0333806d6adecc6f7a91243b2b839ff4d2053823634d4f6ed7a59bc87409122a
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block cmake_flags %}
BUILD_JPIP=ON
BUILD_PKGCONFIG_FILES=ON
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib

ln -s openjpeg* cmake

echo > cmake/OpenJPEGTargets.cmake

cd pkgconfig

for i in *.pc; do
    sed -e 's|bindir.*||' -i ${i}
done
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I$(echo ${out}/include/openjpeg*) \${CPPFLAGS}"
{% endblock %}
