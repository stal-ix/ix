{% extends '//mix/c_std.sh' %}

{% block fetch %}
{% include '//bin/mrustc/ver.sh' %}
https://static.rust-lang.org/dist/rustc-1.54.0-src.tar.gz
sha:ac8511633e9b5a65ad030a1a2e5bdaa841fdfe3132f2baaa52cc04e71c6c6976
{% endblock %}

{% block unpack %}
mkdir src; cd src
extract 1 ${src}/v*
extract 0 ${src}/rust*
{% endblock %}

{% block bld_tool %}
bin/mrustc
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/openssl/1
bin/mrustc/stubs
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
cd rustc-1.54.0-src
patch -p0 < ../rustc-1.54.0-src.patch
{% endblock %}

{% block setup %}
unset HOST_CC
unset HOST_CXX
unset HOST_AR
unset HOST_RANLIB

export CFLAGS="-O0 -g ${CFLAGS}"
export OPENSSL_DIR=${lib_openssl_1}
export RUSTC_VERSION=1.54.0
export MRUSTC_TARGET_VER=1.54
export OUTPUT_DIR=${PWD}/obj
export MRUSTC_LIBDIR=${OUTPUT_DIR}
export RUSTC_SRC=${PWD}/rustc-1.54.0-src
export VENDOR_DIR=${RUSTC_SRC}/vendor
export OVERRIDE_DIR=${PWD}/script-overrides/stable-1.54.0-linux
export MINICARGO_FLAGS="--manifest-overrides ${PWD}/rustc-1.54.0-overrides.toml"
{% endblock %}

{% block build %}
cargo1() (
    minicargo ${1} \
        --script-overrides ${OVERRIDE_DIR} \
        --output-dir ${OUTPUT_DIR} \
        --vendor-dir ${VENDOR_DIR} \
        ${MINICARGO_FLAGS}
)

cargo2() (
    minicargo ${1} \
        --output-dir ${OUTPUT_DIR} \
        --vendor-dir ${VENDOR_DIR} \
        -L ${OUTPUT_DIR} \
        ${MINICARGO_FLAGS}
)

cargo3() (
    minicargo ${1} \
        --output-dir ${OUTPUT_DIR} \
        ${MINICARGO_FLAGS}
)

cargo1 ${RUSTC_SRC}/library/std
cargo1 ${RUSTC_SRC}/library/panic_unwind
cargo1 ${RUSTC_SRC}/library/test
cargo3 lib/libproc_macro
cargo2 ${RUSTC_SRC}/src/tools/cargo
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${OUTPUT_DIR}/cargo ${out}/bin/
{% endblock %}
