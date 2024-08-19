{% extends '//die/c/cmake.sh' %}

{% block git_repo %}
https://github.com/vbpf/ebpf-verifier
{% endblock %}

{% block git_commit %}
cd9344bdbbfc0a48b8c079cd8eeaf4abb3d6240a
{% endblock %}

{% block git_sha %}
9359f2ee013a31cc172393796927c17be285fb6c3e0f9a540bc1ba8069107147
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/boost
lib/kernel
lib/yaml/cpp
lib/build/muldefs
{% endblock %}

{% block patch %}
sed -e 's|.*FetchContent_MakeAvailable.*||' \
    -e 's|Catch2::Catch2WithMain|c|' \
    -i CMakeLists.txt
find src/test -type f -name '*.cpp' | while read l; do
    echo 'int main() {}' > ${l}
done
{% endblock %}

{% block setup_target_flags %}
export CXXFLAGS="-Wno-c++11-narrowing ${CXXFLAGS}"
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/check ${tmp}/run_yaml ${out}/bin/
{% endblock %}

