{% extends '//lib/fizzy/ix.sh' %}

{% block bld_libs %}
{{super()}}
lib/fizzy
lib/wasi/uv
lib/shim/fake(lib_name=stdc++fs)
{% endblock %}

{% block cmake_flags %}
{{super()}}
FIZZY_WASI=ON
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|.*ProjectUVWASI.*||' \
    -e 's|.*uvwasi::uvwasi.*||' \
    -i tools/wasi/CMakeLists.txt
{% endblock %}

{% block cpp_includes %}
{{super()}}
${PWD}/lib/fizzy
{% endblock %}

{% block build_flags %}
{{super()}}
shut_up
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp ${tmp}/obj/bin/fizzy-wasi ${out}/bin/
{% endblock %}
