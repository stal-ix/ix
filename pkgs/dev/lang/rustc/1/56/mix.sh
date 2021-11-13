{% extends '//mix/template/pkg.sh' %}

{% block fetch %}
https://static.rust-lang.org/dist/rust-1.56.1-aarch64-apple-darwin.pkg
769d2f6a9c80129582e66de7123b784b
{% endblock %}

{% block bld_deps %}
tool/compress/bsdtar/mix.sh
env/tools/mix.sh
{% endblock %}

{% block unpack %}
bsdtar xf ${src}/*.pkg
{% endblock %}

{% block build %}
bsdtar xf rustc.pkg/Scripts
bsdtar xf rust-std.pkg/Scripts
bsdtar xf cargo.pkg/Scripts
{% endblock %}

{% block install %}
for x in cargo rust-std-aarch64-apple-darwin rustc; do
    cp -R ${x}/* ${out}/
done
{% endblock %}

{% block cleanup_pkg %}
{% endblock %}

{% block test %}
${out}/bin/cargo
${out}/bin/rustc
{% endblock %}

{% block prepare_env %}
cat << EOF > ${out}/env
export LDFLAGS="-L${out} \${LDFLAGS}"
EOF
{% endblock %}
