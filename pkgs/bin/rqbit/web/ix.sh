{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/ikatson/rqbit/archive/refs/tags/v7.0.1.tar.gz
sha:78f4e27da1f63a63e48b8fcd813d5e25db62971b74072fbbf055e9241d3514b3
{% endblock %}

{% block bld_tool %}
bld/npm
bld/pzd/ser
{% endblock %}

{% block use_network %}true{% endblock %}

{% set sum %}01d989a8fd937c8a48688d1e027bbfc195872cc7297d51fe9cda835796b6d6a1{% endset %}
{% set nam %}web_{{sum}}.pzd{% endset %}

{% block predict_outputs %}
[{"path": "share/{{nam}}", "sum": "{{sum}}"}]
{% endblock %}

{% block build %}
(
cd desktop
npm install
)

(
cd crates/librqbit/webui
npm install
)

mkdir www
mv desktop crates/librqbit/webui www/

(
cd www
stable_pack_v3 {{sum}} ${tmp}/rqbit.pzd .
)
{% endblock %}

{% block install %}
mkdir ${out}/share
cp ${tmp}/rqbit.pzd ${out}/share/{{nam}}
{% endblock %}

{% block env %}
export RQ_UI=${out}/share/{{nam}}
{% endblock %}
