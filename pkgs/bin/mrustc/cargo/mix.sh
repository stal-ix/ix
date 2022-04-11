{% extends '//bin/mrustc/t/mix.sh' %}

{% block bld_libs %}
lib/c
lib/z
lib/openssl/1
bin/mrustc/std
bin/mrustc/stubs
{% endblock %}

{% block build %}
{{super()}}
cargo ${RUSTC_SRC}/src/tools/cargo
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${OUTPUT_DIR}/cargo ${out}/bin/
{% endblock %}
