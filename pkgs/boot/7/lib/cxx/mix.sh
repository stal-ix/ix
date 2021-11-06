{% extends '//mix/template/template.sh' %}

{% block fetch %}
{% include '//mix/template/fetch_llvm.sh' %}
{% endblock %}

{% block lib_deps %}
boot/7/lib/cxx/rt/mix.sh
{% endblock %}

{% block bld_deps %}
{{'boot/7/lib/linux/mix.sh' | linux}}
boot/6/env/std/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-w -D_LIBCPP_BUILDING_LIBRARY -D_LIBCPP_HAS_NO_PRAGMA_SYSTEM_HEADER -iquote src -Iinclude -DLIBCXXRT -std=c++14 ${CPPFLAGS}"
{% endblock %}

{% block postunpack %}
cd libcxx
{% endblock %}

{% block patch %}
cat << EOF > include/__config_site
#pragma once

#define _LIBCPP_HAS_MERGED_TYPEINFO_NAMES_DEFAULT 0
#define _LIBCPP_HAS_NO_INT128 1
#define _LIBCPP_DISABLE_AVAILABILITY 1
{% if mix.platform.target.os == 'linux' %}
#define _LIBCPP_HAS_MUSL_LIBC 1
{% endif %}
EOF
{% endblock %}

{% block build %}
for s in src/*.cpp src/filesystem/*.cpp; do
    out=$(echo ${s} | tr '/' '_' | tr -d '\n').o
    clang++ -c ${s} -o ${out}
done

ar q libc++.a *.o
ranlib libc++.a
{% endblock %}

{% block install %}
cp -R include ${out}
mkdir ${out}/lib && cp libc++.a ${out}/lib/
{% endblock %}

{% block env %}
export LDFLAGS="-lpthread -ldl \${LDFLAGS}"
{% endblock %}

{% block test %}
cat << EOF > test.cpp
#include <iostream>

int main() {
    std::cout << "helo" << std::endl;
}
EOF

clang++ -o test_main ${out}/lib/libc++.a test.cpp

./test_main
{% endblock %}
