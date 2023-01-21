{% extends '//die/c/ix.sh' %}

{% block step_unpack %}
:
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block build %}
cat << EOF > test1.cpp
#include <iostream>
#include <errno.h>

int main() {
    errno = 0;
    std::cerr << (size_t)realloc(0, 0) << std::endl;
    std::cerr << errno << std::endl;
    std::cerr << (size_t)reallocarray(0, 0, 16) << std::endl;
    std::cerr << errno << std::endl;
    std::cerr << (size_t)malloc(0) << std::endl;
    std::cerr << errno << std::endl;
}
EOF

cc -o test1 test1.cpp

cat test1.cpp
echo '------'
./test1
{% endblock %}
