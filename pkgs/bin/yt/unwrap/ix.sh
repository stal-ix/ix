{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ytsaurus/ytsaurus/archive/c39e2e8a9a262feadb55bb9e13c42b3af65784b9.zip
sha:d13edc9fc1f6ec750898c7bf967cd9273fec0768b53b22bfacc6317856bc9c3d
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c/ares
lib/execinfo
lib/openssl/1
lib/bsd/overlay
lib/python/3/11
{% endblock %}

{% block bld_tool %}
bin/yasm
bld/bison
pip/jinja2
pip/dacite
bld/python
pip/PyYAML
bin/ragel/6
bld/devendor
bld/fake(tool_name=conan)
{% endblock %}

{% block build_flags %}
wrap_cc
{% endblock %}

{% block cpp_defines %}
_musl_=1
{% endblock %}

{% block patch %}
find . -type f -name CMakeLists.txt | while read l; do
    sed -e 's|OpenSSL::OpenSSL||g' \
        -e 's|c-ares::c-ares||g' \
        -i ${l}
done

devendor contrib/libs/cxxsupp

cat << EOF > contrib/libs/cxxsupp/libcxx/include/stlfwd
#pragma once
#include <iostream>
#include <array>
#include <map>
#include <list>
#include <string>
#include <vector>
#include <memory>
#include <deque>
#include <tuple>
#include <set>
#include <functional>
EOF

cat << EOF >> contrib/libs/llvm12/include/llvm/Config/config-linux.h
#undef HAVE_MALLINFO
EOF

cat << EOF > util/system/fasttime.cpp
#include "fasttime.h"
#include "datetime.h"

ui64 InterpolatedMicroSeconds() {
    return MicroSeconds();
}
EOF

sed -e 's|_musl_|_qqq_|' -i yt/yt/library/profiling/perf/counters.cpp
{% endblock %}

{% block build %}
mkdir -p ${tmp}/obj/bin/bison/bin
ln -s $(which yasm) ${tmp}/obj/bin/
ln -s $(which ragel) ${tmp}/obj/bin/
ln -s $(which bison) ${tmp}/obj/bin/bison/bin/
{{super()}}
{% endblock %}

{% block ninja_build_targets %}
ytserver-all
#liblibrary-profiling-perf.a
{% endblock %}
