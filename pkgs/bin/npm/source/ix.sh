{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/npm/cli/archive/refs/tags/v10.9.1.tar.gz
sha:8f8dc61374b66992ad1613185fa66b4059c8826964164c2766dbc75eb609b9fd
{% endblock %}

{% block use_network %}true{% endblock %}

{% set sum %}986eb91733ee4189aa095e61c320f36f16afad83d6bf23d210630f45dc8b24e9{% endset %}
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
