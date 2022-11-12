{% extends '//die/c/ix.sh' %}

{% block fetch %}
{% include 'ver.sh' %}
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

export OUTPUT_DIR=${tmp}/rst

mkdir ${OUTPUT_DIR}

export RUSTC_VERSION=1.54.0
export MRUSTC_TARGET_VER=1.54
export RUSTC_SRC=${PWD}/rustc-1.54.0-src
export VENDOR_DIR=${RUSTC_SRC}/vendor
export OVERRIDE_DIR=${PWD}/script-overrides/stable-1.54.0-linux
{% endblock %}

{% block functions %}
{{super()}}
cargo() (
    export MRUSTC_LIBDIR=${OUTPUT_DIR}
    export MRUSTC_PATH=$(which mrustc)

    minicargo ${@} \
        -j ${make_thrs}  \
        -L ${OUTPUT_DIR} \
        -L ${MRUSTC_STD} \
        --output-dir ${OUTPUT_DIR} \
        --vendor-dir ${VENDOR_DIR} \
        --manifest-overrides ${PWD}/rustc-1.54.0-overrides.toml
)
{% endblock %}
