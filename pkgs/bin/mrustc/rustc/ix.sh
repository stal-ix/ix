{% extends '//bin/mrustc/t/t/ix.sh' %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
{{super()}}
{% endblock %}

{% block build %}
{{super()}}
cargo ${RUSTC_SRC}/compiler/rustc --feature llvm
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${OUTPUT_DIR}/rustc ${out}/bin/
{% endblock %}
