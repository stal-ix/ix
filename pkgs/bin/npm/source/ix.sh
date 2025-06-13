{% extends '//die/std/ix.sh' %}

# noauto

{% block pkg_name %}
npm
{% endblock %}

{% block version %}
11.1.0
{% endblock %}

{% block fetch %}
https://github.com/npm/cli/archive/refs/tags/v{{self.version().strip()}}.tar.gz
74ab2ea044ba55447e5d65f31a9ab6aefe9224eb755cbdf64a1b6c057e777992
{% endblock %}

{% block use_network %}true{% endblock %}

{% set sum %}17376f12bc40e867e5919911708a2650f66f96255e24fb74bb568af53eae5171{% endset %}
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
