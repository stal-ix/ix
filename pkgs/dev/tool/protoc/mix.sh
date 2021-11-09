{% extends '//mix/template/proxy.sh' %}

{% block bld_deps %}
lib/protobuf/mix.sh
env/tools/mix.sh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp $(command -v protoc) ${out}/bin/
{% endblock %}
