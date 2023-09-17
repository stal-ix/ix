{% extends '//bin/mrustc/t/t/ix.sh' %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
lib/llvm/12
lib/shim/fake(lib_name=stdc++)
{{super()}}
{% endblock %}

{% block setup %}
{{super()}}
export RUSTC_INSTALL_BINDIR=${out}/bin
export REAL_LIBRARY_PATH_VAR=LD_LIBRARY_PATH
{% endblock %}

{% block build %}
{{super()}}
cargo ${RUSTC_SRC}/compiler/rustc --features llvm
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${OUTPUT_DIR}/rustc_main ${out}/bin/rustc
{% endblock %}
