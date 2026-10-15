{% extends '//die/rust/cargo.sh' %}

{% block pkg_name %}
inotify-tools
{% endblock %}

{% block version %}
4.26.262
{% endblock %}

{% block cargo_url %}
https://github.com/inotify-tools/inotify-tools/archive/refs/tags/{{self.version().strip()}}.tar.gz
{% endblock %}

{% block cargo_sha %}
63fa71496d82ae17f1bb3c3ce4c39e8cc5bb5a169994398e167ff542116e367d
{% endblock %}

{% block cargo_fetch_sha %}
989895241148580c820872ecd4f2b06f3dd8c5d72f61c4852dbf936beb2b067f
{% endblock %}

{% block bld_tool %}
bld/make
{% endblock %}

{% block bld_libs %}
lib/c
{% endblock %}

{% block patch %}
echo {{self.version().strip()}} > VERSION
{% endblock %}

{% block build %}
export CC=$(command -v cc)
export CXX=$(command -v c++)
export HOST_CC=${CC}
export HOST_CXX=${CXX}
export TARGET_CC=${CC}
export TARGET_CXX=${CXX}
export RUSTC_BOOTSTRAP=1
make \
    CARGO=cargo \
    CARGOFLAGS=--offline \
    TARGET={{target.rust}} \
    CARGO_TARGET_DIR=${tmp}
{% endblock %}

{% block install %}
make install \
    CARGO=cargo \
    CARGOFLAGS=--offline \
    TARGET={{target.rust}} \
    CARGO_TARGET_DIR=${tmp} \
    ENABLE_SHARED=0 \
    prefix=${out}
{% endblock %}

{% block cargo_tool %}
bld/cargo/96
{% endblock %}
