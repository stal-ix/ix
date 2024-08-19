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
lib/catch/2
lib/yaml/cpp
{% endblock %}

{% block patch %}
sed -e 's|.*FetchContent_MakeAvailable.*||' \
    -e 's|Catch2::Catch2WithMain|c|' \
    -i CMakeLists.txt
{% endblock %}

