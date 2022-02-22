{% extends '//mix/c_std.sh' %}

{% block bld_libs %}
lib/c
lib/c++
lib/magic/iface
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

extern "C" const char* magic_mime_type(const void* data, size_t len);

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

    auto s = slurp(argv[1]);

    std::cout << magic_mime_type(s.c_str(), s.length()) << std::endl;
}
EOF

cc -o mimetype main.cpp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp mimetype ${out}/bin/
{% endblock %}
