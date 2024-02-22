{% extends '//die/std/ix.sh' %}

{% block bld_tool %}
bld/fetch
bld/extract
bld/stable/pack
{% endblock %}

{% block use_network %}true{% endblock %}

{% block predict_outputs %}
[{"path": "share/{{fname}}", "sum": "{{sha}}"}]
{% endblock %}

{% block step_unpack %}
mkdir net
cd net
fetch "{{url}}"
cd ..
mkdir src
cd src
extract 1 ../net/*
{% endblock %}

{% block packer %}
stable_pack
{% endblock %}

{% block step_build %}
set -xue
{{super()}}
{% if refine %}
{{refine | b64d}}
{% endif %}
cd ..
find src/
{{self.packer().strip()}} {{sha}} ${tmp}/{{fname}} src
{% endblock %}

{% block install %}
mkdir ${out}/share
mv ${tmp}/{{fname}} ${out}/share/
ls -la ${out}/share/
sha256sum ${out}/share/*
{% endblock %}

{% block env %}
export src="${out}/share"
{% endblock %}
