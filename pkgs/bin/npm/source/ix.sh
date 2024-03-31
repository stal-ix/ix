{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/npm/cli/archive/refs/tags/v10.4.0.tar.gz
sha:d8c7bf11ea8c0cf13b936e8ad936358745a682f3f64fc22e5c50d48f06966f66
{% endblock %}

{% block use_network %}true{% endblock %}

{% set sum %}2c431a7fb7c04a5f400f7ba0dca221fdb94b4b3a070fac53db8017fa1b6532c6{% endset %}

{% block predict_outputs %}
[{"path": "share/npm_2.tar.lz4", "sum": "{{sum}}"}]
{% endblock %}

{% block bld_tool %}
bld/npm
bld/stable/pack
{% endblock %}

{% block build %}
npm install
rm -rf undefined
stable_pack_v2 {{sum}} ${tmp}/npm_2.tar.lz4 .
{% endblock %}

{% block install %}
mkdir ${out}/share
mv ${tmp}/npm_2.tar.lz4 ${out}/share/
{% endblock %}

{% block env %}
export src=${out}/share/npm_2.tar.lz4
{% endblock %}
