{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/ytsaurus/ytsaurus/archive/c39e2e8a9a262feadb55bb9e13c42b3af65784b9.zip
sha:d13edc9fc1f6ec750898c7bf967cd9273fec0768b53b22bfacc6317856bc9c3d
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/c/ares
lib/openssl/1
lib/python/3/11
{% endblock %}

{% block bld_tool %}
bin/yasm
bld/python
bld/devendor
bld/fake(tool_name=opt)
bld/fake(tool_name=conan)
bld/fake(tool_name=llvm-link)
{% endblock %}

{% block patch %}
find . -type f -name CMakeLists.txt | while read l; do
    sed -e 's|OpenSSL::OpenSSL||g' \
        -e 's|c-ares::c-ares||g' \
        -i ${l}
done
devendor contrib/libs/cxxsupp
devendor contrib/libs/libc_compat
{% endblock %}

{% block build %}
mkdir -p ${tmp}/obj/bin
ln -s $(which yasm) ${tmp}/obj/bin/
{{super()}}
{% endblock %}
