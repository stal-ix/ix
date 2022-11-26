{% extends '//bin/mrustc/t/ix.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block bld_libs %}
lib/shim/fake(lib_name=gcc_s)
lib/shim/fake(lib_name=atomic)
{% endblock %}

{% block build %}
export MRUSTC_STD=${PWD}
{{super()}}
cargo ${RUSTC_SRC}/library/std --script-overrides ${OVERRIDE_DIR}
cargo ${RUSTC_SRC}/library/panic_unwind --script-overrides ${OVERRIDE_DIR}
cargo ${RUSTC_SRC}/library/test --script-overrides ${OVERRIDE_DIR}
cargo lib/libproc_macro
{% endblock %}

{% block install %}
cp -R ${OUTPUT_DIR} ${out}/lib
{% endblock %}

{% block env_lib %}
export MRUSTC_STD="${out}/lib"
{% endblock %}
