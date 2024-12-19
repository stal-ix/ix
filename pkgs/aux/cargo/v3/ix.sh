{% extends '//aux/fetch/ix.sh' %}

{% block fname %}
cargo_v3_{{parent_id}}.pzd
{% endblock %}

{% block bld_tool %}
bld/git
bld/rust(rustc_ver={{cargoc_ver}})
{{super()}}
{% endblock %}

{% block build %}
export CARGO_HOME=${tmp}/crg
mkdir -p .cargo
cat << EOF >> .cargo/config.toml
[net]
git-fetch-with-cli = true
EOF
cargo vendor vendored >> .cargo/config.toml
find . -name '*.a' -type f -delete
{% endblock %}
