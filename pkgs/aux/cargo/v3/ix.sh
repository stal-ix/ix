{% extends '//aux/fetch/ix.sh' %}

{% block fname %}
cargo_v3_{{parent_id}}.pzd
{% endblock %}

{% block bld_tool %}
bld/git
bld/cargo
aux/ca/bundle
{{super()}}
{% endblock %}

{% block build %}
git config --global http.proxy 'socks5://lab1.local:8015'

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
