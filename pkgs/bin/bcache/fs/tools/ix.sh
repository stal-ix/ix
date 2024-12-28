{% extends '//die/rust/cargo.sh' %}

{% include 'ver.sh' %}

{% block bld_libs %}
lib/llvm/19
lib/bcache/fs
{% endblock %}

{% block patch %}
{{super()}}
sed -e 's|"runtime"|"static"|' \
    -i vendored/bindgen/Cargo.toml
cat << EOF > vendored/clang-sys/build/static.rs
pub fn link() {
}
EOF
{% endblock %}

{% block build %}
>libbcachefs.a
{{super()}}
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ${tmp}/out/bcachefs ${out}/bin/
{% endblock %}
