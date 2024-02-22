{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/zyedidia/micro/archive/refs/tags/v2.0.13.tar.gz
{% endblock %}

{% block go_sha %}
458b5cf3d1fa4e289e96663a48eda16b65fd345de53f0ab75884cb2a5d53dbc5
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/micro
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp micro ${out}/bin/
{% endblock %}
