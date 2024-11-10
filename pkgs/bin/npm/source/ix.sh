{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/npm/cli/archive/refs/tags/v10.4.0.tar.gz
sha:d8c7bf11ea8c0cf13b936e8ad936358745a682f3f64fc22e5c50d48f06966f66
{% endblock %}

{% block use_network %}true{% endblock %}

{% set sum %}2c431a7fb7c04a5f400f7ba{% endset %}

{% block predict_outputs %}
[{"path": "share/npm_2.pzd", "sum": "{{sum}}"}]
{% endblock %}

{% block bld_tool %}
bld/npm
bld/pzd/ser
{% endblock %}

{% block build %}
npm install
rm -rf undefined
stable_pack_v3 {{sum}} ${tmp}/npm_2.pzd .
{% endblock %}

{% block install %}
mkdir ${out}/share
mv ${tmp}/npm_2.pzd ${out}/share/
{% endblock %}

{% block env %}
export src=${out}/share/npm_2.pzd
{% endblock %}
