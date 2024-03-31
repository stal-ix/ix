{% extends '//aux/fetch/ix.sh' %}

{% block fname %}
cargo_v3_{{parent_id}}.pzd
{% endblock %}

{% block packer %}stable_pack_v3{% endblock %}

{% block bld_tool %}
bld/git
bld/rust
aux/ca/bundle
{{super()}}
{% endblock %}

{% block build %}
export SSL_CERT_FILE=${CA_BUNDLE}
export CARGO_HOME=${tmp}/crg

mkdir -p .cargo

cat << EOF >> .cargo/config.toml
[net]
git-fetch-with-cli = true
EOF

cargo vendor vendored >> .cargo/config.toml

find . -name '*.a' -type f -delete
{% endblock %}
