{% extends '//bin/mrustc/t/ix.sh' %}

{% block bld_libs %}
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
export CFG_RELEASE=${RUSTC_VERSION}
export CFG_COMPILER_HOST_TRIPLE=x86_64-linux-gnu
export CFG_RELEASE_CHANNEL=stable
export CFG_VERSION=${CFG_RELEASE}-stable-mrustc
export CFG_PREFIX=mrustc
export CFG_LIBDIR_RELATIVE=lib
{% endblock %}

{% block build %}
{{super()}}
cp -R ${MRUSTC_STD}/* ${OUTPUT_DIR}/
{% endblock %}
