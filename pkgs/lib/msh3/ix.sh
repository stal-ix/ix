{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/nibanks/msh3/archive/refs/tags/v0.4.0.tar.gz
sha:07eaa26a027e60cbf16576741706b81fcbd7e68cfb5e2cc517211450b5b036c9
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

{% block env_lib %}
export COFLAGS="--with-msh3=${out} \${COFLAGS}"
{% endblock %}
