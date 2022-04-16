{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/microsoft/mimalloc/archive/refs/tags/v2.0.6.tar.gz
sha:9f05c94cc2b017ed13698834ac2a3567b6339a8bde27640df5a1581d49d05ce5
{% endblock %}

{% block bld_libs %}
lib/c++/headers
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

{% block env_lib %}
export CPPFLAGS="-I${out}/include/mimalloc-2.0 \${CPPFLAGS}"
{% endblock %}
