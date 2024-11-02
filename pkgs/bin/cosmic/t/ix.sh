{% extends '//die/rust/cargo.sh' %}

{% block bld_tool %}
{{super()}}
bin/just
bld/fakegit
{% endblock %}

{% block build %}
export VERGEN_GIT_COMMIT_DATE="x"
export VERGEN_GIT_SHA="x"
{{super()}}
{% endblock %}

{% block install %}
just --set prefix ${out} install
{% endblock %}
