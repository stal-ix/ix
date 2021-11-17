{% extends 'std.sh' %}

{% block std_env %}
dev/lang/rustc/1/56/mix.sh
{{super()}}
{% endblock %}

{% block setup %}
export CARGO_BUILD_JOBS=${make_thrs}
export CARGO_INSTALL_ROOT=${out}
export CARGO_HOME=${tmp}/obj
{% endblock %}

{% set cargo_options %}
{% block cargo_options %}
{% endblock %}
{% endset %}

{% block build %}
cargo build --release {{mix.fix_list(cargo_options)}}
{% endblock %}

{% block install %}
cargo install --path .
{% endblock %}
