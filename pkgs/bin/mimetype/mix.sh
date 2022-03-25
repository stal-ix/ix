{% extends '//mix/c_std.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/mimetype
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block build %}
cat << EOF > main.cpp
#include <string>
#include <fstream>
#include <sstream>
#include <iostream>

extern "C" const char* magic_mime_type_ex(const char* path, const void* data, size_t len);

static inline std::string slurp(const char* path) {
    std::ostringstream buf;
    std::ifstream input(path);
    buf << input.rdbuf();
    return buf.str();
}

int main(int argc, char** argv) {
    if (argc < 2) {
        return 1;
    }

    auto p = argv[1];
    auto s = slurp(p);

    std::cout << magic_mime_type_ex(p, s.c_str(), std::min<size_t>(s.length(), 1024)) << std::endl;
}
EOF

cc -o mimetype main.cpp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp mimetype ${out}/bin/
{% endblock %}
