{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/npm/cli/archive/refs/tags/v9.8.0.tar.gz
sha:7a6c27c9c0fe6f39069365c33a93e43f5ae2b09f80943ec9309240f809440128
{% endblock %}

{% block use_network %}true{% endblock %}

{% set sum %}7b0c76c04670bcc8600960f209af83ccb817db0d64f9345c9eb4d9aefa168f7e{% endset %}
{% set nam %}npm_1_{{sum}}.pzd{% endset %}

{% block predict_outputs %}
[{"path": "share/{{nam}}", "sum": "{{sum}}"}]
{% endblock %}

{% block bld_tool %}
bin/nodejs
bld/pzd/ser
{% endblock %}

{% block build %}
node workspaces/arborist/bin/index.js reify
node bin/npm-cli.js install
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
