{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/nibanks/msh3/archive/refs/tags/v0.6.0.tar.gz
sha:55f4dd6dbafe043cd68a6b6cda13b365c1943d2e364d608608359d4987f27fa2
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/msquic
lib/qpack/ls
{% endblock %}

{% block bld_libs %}
lib/bsd/overlay
{% endblock %}

{% block cpp_includes %}
${PWD}
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-std=c++20 ${CXXFLAGS}"
{% endblock %}

{% block patch %}
find . -type f -name CMakeLists.txt | while read l; do
    sed -e 's|add_.*msquic.*||' \
        -e 's|add_.*qpack.*||' \
        -e 's|target.*inc.*cxx.*||' \
        -e 's|target.*msh3.*PRIVATE.*||' \
        -e 's|msh3 inc.*|msh3)|' \
        -i ${l}
done
{% endblock %}

{% block env_lib %}
export COFLAGS="--with-msh3=${out} \${COFLAGS}"
{% endblock %}
