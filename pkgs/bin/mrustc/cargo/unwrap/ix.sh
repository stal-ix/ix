{% extends '//bin/mrustc/t/ix.sh' %}

{% block bld_libs %}
lib/z
lib/xz
lib/curl
lib/openssl
lib/git/2/old
bin/mrustc/std
lib/shim/fake(lib_name=gcc_s)
lib/shim/fake(lib_name=atomic)
{% endblock %}

{% block patch %}
{{super()}}
for x in curl-sys libgit2-sys libnghttp2-sys libssh2-sys libz-sys lzma-sys; do
    echo 'fn main() {}' > vendor/${x}/build.rs
done
{% endblock %}

{% block setup %}
{{super()}}
export OPENSSL_DIR=${SSL_DIR}
{% endblock %}

{% block build %}
{{super()}}
cargo ${RUSTC_SRC}/src/tools/cargo
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${OUTPUT_DIR}/cargo ${out}/bin/
{% endblock %}
