{% extends '//aux/fetch/ix.sh' %}

{% block fname %}
cargo_{{parent_id}}.tar.lz4
{% endblock %}

{% block bld_tool %}
bld/rust
aux/ca/bundle
bin/git/unwrap
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
