{% extends '//die/proxy.sh' %}

{% block lib_deps %}
lib/c
lib/c++
{% endblock %}

{% block install %}
mkdir -p ${out}/include/experimental
cat << EOF > ${out}/include/experimental/filesystem
#pragma once
#include <filesystem>
namespace std {
    namespace experimental {
        namespace filesystem {
            using namespace std::__fs::filesystem;
        }
    }
}
EOF
{% endblock %}
