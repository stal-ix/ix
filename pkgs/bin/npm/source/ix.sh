{% extends '//die/std/ix.sh' %}

{% block fetch %}
https://github.com/npm/cli/archive/refs/tags/v9.8.1.tar.gz
sha:f91819e7a5a31c840d7f37a68db39bdddc0b37c5a819a968537cdfd4182e053a
{% endblock %}

{% block use_network %}true{% endblock %}

{% set sum %}e2255fa1ad3a9a846f928c8ac58ad7f8bef9{% endset %}

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
find . -type l -delete
stable_pack {{sum}} ${tmp}/npm_2.tar.lz4 .
{% endblock %}

{% block install %}
mkdir ${out}/share
mv ${tmp}/npm_2.tar.lz4 ${out}/share/
{% endblock %}

{% block env %}
export src=${out}/share/npm_2.tar.lz4
{% endblock %}
