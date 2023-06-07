{% extends '//die/c/cmake.sh' %}

{% block git_sha %}
69f1cf05e42e8565d85622c2a40569392b2e3ca5058f29200725adeec553832c
{% endblock %}

{% block git_repo %}
https://gitlab.com/mnauw/cppgir
{% endblock %}

{% block git_branch %}
master
{% endblock %}

{% block git_commit %}
960fe054ffaab7cf55722fea6094c56a8ee8f18e
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
lib/fmt
lib/boost
lib/shim/fake(lib_name=stdc++fs)
{% endblock %}

{% block patch %}
cat << EOF >> tools/common.hpp
#include <map>
#include <filesystem>
EOF

find . -name '*.cpp' | while read l; do
    sed -e 's|experimental/filesystem|filesystem|' \
        -e 's|std::experimental::filesystem|std::__fs::filesystem|' \
        -i ${l}
done
{% endblock %}
