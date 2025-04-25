{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include '//lib/llvm/13/ver.sh' %}
{% endblock %}

{% block cpp_defines %}
_LIBCPP_BUILDING_LIBRARY=1
_LIBCPP_HAS_NO_PRAGMA_SYSTEM_HEADER=1
LIBCXXRT=1
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block setup_target_flags %}
export CPPFLAGS="-iquote src -Iinclude -std=c++14 ${CPPFLAGS}"
{% endblock %}

{% block unpack %}
{{super()}}
cd libcxx
{% endblock %}

{% block patch %}
patch -p2 << EOF
{% include '//lib/c++/13/gcc-13.patch' %}
EOF
cat << EOF > include/__config_site
#pragma once

#define _LIBCPP_HAS_MERGED_TYPEINFO_NAMES_DEFAULT 0
#define _LIBCPP_HAS_NO_INT128 1
#define _LIBCPP_DISABLE_AVAILABILITY 1
{% if linux %}
#define _LIBCPP_HAS_MUSL_LIBC 1
{% endif %}
EOF
{% endblock %}

{% block build %}
for s in src/*.cpp src/filesystem/*.cpp; do
    out=$(echo ${s} | tr '/' '_' | tr -d '\n').o
    c++ -c ${s} -o ${out}
done

ar qs libc++.a *.o
{% endblock %}

{% block install %}
cp -R include ${out}
mkdir ${out}/lib && cp libc++.a ${out}/lib/
{% endblock %}

{% block env %}
export LDFLAGS="-lpthread -ldl \${LDFLAGS}"
{% endblock %}
