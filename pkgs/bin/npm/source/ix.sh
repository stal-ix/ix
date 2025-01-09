{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/npm/cli/archive/refs/tags/v10.9.2.tar.gz
sha:6b19afc5ba4bf92108ec366feaf82107fc137274c42158588b2cf9117bc870dc
{% endblock %}

{% block use_network %}true{% endblock %}

{% set sum %}94568cd76a71d55bf03400c2c04d436e23f80ccc64eb2e0943a7550f07d70c8d{% endset %}
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
