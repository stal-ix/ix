{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/npm/cli/archive/refs/tags/v11.1.0.tar.gz
sha:74ab2ea044ba55447e5d65f31a9ab6aefe9224eb755cbdf64a1b6c057e777992
{% endblock %}

{% block use_network %}true{% endblock %}

{% set sum %}722c8b353849a34dbc01f9a5fb77fe6ffe53fb2d12296beeb4c80a4a29f11de6{% endset %}
{% set nam %}npm_{{sum}}.pzd{% endset %}

{% block predict_outputs %}
[{"path": "share/{{nam}}", "sum": "{{sum}}"}]
{% endblock %}

{% block bld_tool %}
bld/npm
bld/pzd/ser
{% endblock %}

{% block build %}
npm install
rm -rf undefined
stable_pack_v3 {{sum}} ${tmp}/npm.pzd .
{% endblock %}

{% block install %}
mkdir ${out}/share
mv ${tmp}/npm.pzd ${out}/share/{{nam}}
{% endblock %}

{% block env %}
export src=${out}/share/{{nam}}
{% endblock %}
