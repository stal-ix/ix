{% extends '//bin/mrustc/t/ix.sh' %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
bin/mrustc/std
lib/shim/atomic
{% endblock %}

{% block patch %}
{{super()}}
for x in curl-sys libgit2-sys libnghttp2-sys libssh2-sys libz-sys lzma-sys; do
    echo 'fn main() {}' > vendor/${x}/build.rs
done
{% endblock %}

{% block build %}
{{super()}}
cargo ${RUSTC_SRC}/compiler/rustc
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${OUTPUT_DIR}/rustc ${out}/bin/
{% endblock %}
