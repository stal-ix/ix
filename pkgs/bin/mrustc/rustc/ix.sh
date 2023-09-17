{% extends '//bin/mrustc/t/ix.sh' %}

{% block bld_libs %}
lib/c
lib/z
lib/c++
bin/mrustc/std
lib/shim/fake(lib_name=gcc_s)
{% endblock %}

{% block patch %}
{{super()}}
for x in curl-sys libgit2-sys libnghttp2-sys libssh2-sys libz-sys lzma-sys; do
    echo 'fn main() {}' > vendor/${x}/build.rs
done
{% endblock %}

{% block setup %}
{{super()}}
export CFG_RELEASE=1.54.0
export CFG_COMPILER_HOST_TRIPLE=x86_64-linux-gnu
export CFG_RELEASE_CHANNEL=stable
export CFG_VERSION=${CFG_RELEASE}-stable-mrustc
export CFG_PREFIX=mrustc
export CFG_LIBDIR_RELATIVE=lib
export LD_LIBRARY_PATH=${OUTPUT_DIR}
export REAL_LIBRARY_PATH_VAR=LD_LIBRARY_PATH
export RUSTC_INSTALL_BINDIR=bin
{% endblock %}

{% block build %}
{{super()}}
cp -R ${MRUSTC_STD}/* ${OUTPUT_DIR}/
cargo ${RUSTC_SRC}/compiler/rustc --feature llvm
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${OUTPUT_DIR}/rustc ${out}/bin/
{% endblock %}
