{% extends '//mix/cmake.sh' %}

{% block fetch %}
https://github.com/nibanks/msh3/archive/refs/tags/v0.2.0.tar.gz
sha:9b46bad7a577b958d0da54d3da9fa266550d44ed5d3a34fb7e39b1f505e5f955
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

{% block setup %}
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
