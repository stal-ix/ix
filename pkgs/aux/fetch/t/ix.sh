{% extends '//die/std/ix.sh' %}

{% block bld_tool %}
bld/stable/pack
{% endblock %}

{% block use_network %}true{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{fname}}", "sum": "{{sha}}"}]
{% endblock %}

{% block step_build %}
set -xue
{{super()}}
{% if refine %}
{{refine | b64d}}
{% endif %}
cd ..
stable_pack_2 {{sha}} ${tmp}/{{fname}} src
{% endblock %}

{% block install %}
mkdir ${out}/share
mv ${tmp}/{{fname}} ${out}/share/
ls -la ${out}/share/
sha256sum ${out}/share/*
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
