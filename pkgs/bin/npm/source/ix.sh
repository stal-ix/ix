{% extends '//die/std/ix.sh' %}

{% block pkg_name %}
npm
{% endblock %}

{% block version %}
11.1.0
{% endblock %}

{% block fetch %}
https://github.com/npm/cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
sha:74ab2ea044ba55447e5d65f31a9ab6aefe9224eb755cbdf64a1b6c057e777992
{% endblock %}

{% block use_network %}true{% endblock %}

{% set sum %}fdf91c248eb4fd1d39dce9e85194a223be42db8c8128ba9a1997bf147bca1dd6{% endset %}
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
