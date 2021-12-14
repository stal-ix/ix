{% extends '//mix/template/c_std.sh' %}

{% block fetch %}
{% include '//lib/llvm/t/ver.sh' %}
{% endblock %}

{% block lib_deps %}
boot/7/lib/cxx/rt/mix.sh
boot/7/lib/dso_handle/mix.sh
{% endblock %}

{% block bld_libs %}
{% if target.os == 'linux' %}
boot/7/lib/linux/mix.sh
{% endif %}
{% endblock %}

{% block bld_deps %}
boot/6/env/std/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-w -D_LIBCPP_BUILDING_LIBRARY -D_LIBCPP_HAS_NO_PRAGMA_SYSTEM_HEADER -iquote src -Iinclude -DLIBCXXRT -std=c++14 ${CPPFLAGS}"
{% endblock %}

{% block unpack %}
{{super()}}
cd libcxx
{% endblock %}

{% block patch %}
cat << EOF > include/__config_site
#pragma once

#define _LIBCPP_HAS_MERGED_TYPEINFO_NAMES_DEFAULT 0
#define _LIBCPP_HAS_NO_INT128 1
#define _LIBCPP_DISABLE_AVAILABILITY 1
{% if target.os == 'linux' %}
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
