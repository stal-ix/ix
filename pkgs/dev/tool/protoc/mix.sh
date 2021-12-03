{% extends '//mix/template/proxy.sh' %}

{% block bld_tool %}
lib/protobuf/mix.sh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp $(command -v protoc) ${out}/bin/
{% endblock %}
