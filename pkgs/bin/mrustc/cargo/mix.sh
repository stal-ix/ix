{% extends '//bin/mrustc/t/mix.sh' %}

{% block bld_libs %}
lib/z
lib/openssl/1
bin/mrustc/std
{% endblock %}

{% block setup %}
{{super()}}
export OPENSSL_DIR=${lib_openssl_1}
{% endblock %}

{% block build %}
{{super()}}
cargo ${RUSTC_SRC}/src/tools/cargo
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${OUTPUT_DIR}/cargo ${out}/bin/
{% endblock %}
