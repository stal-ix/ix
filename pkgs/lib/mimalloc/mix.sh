{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v2.0.3.tar.gz
a06e57e9ae10a346ab8a1097c0838fef
{% endblock %}

{% block bld_libs %}
lib/c++/headers
{% endblock %}

{% block std_box %}
bld/bootbox
{% endblock %}

{% block cmake_flags %}
MI_USE_CXX=ON
MI_OVERRIDE=ON
MI_BUILD_STATIC=ON
MI_BUILD_SHARED=OFF
MI_BUILD_TESTS=OFF
{% endblock %}

{% block install %}
{{super()}}

cd ${out}/lib

mv mimalloc-*/* ./
rm -rf mimalloc-*
{% endblock %}

{% block test_lib %}
${NM} --demangle ${out}/lib/mimalloc.o | grep '::' | grep __1 | grep -v atomic | while read l; do
    echo 'EXPECT CONFLICT with another STL'
    exit 1
done

echo 'ALL OK'
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/mimalloc-2.0 \${CPPFLAGS}"
{% endblock %}
