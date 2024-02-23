{% extends '//die/go/build_v2.sh' %}

{% block go_url %}
https://github.com/cli/cli/archive/refs/tags/v2.14.4.tar.gz
{% endblock %}

{% block go_sha %}
43e96dddb579f32e7f5427d17adf5ba877a0d27b4aec4c72cd12c80abbeab213
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gh ${out}/bin/
{% endblock %}
