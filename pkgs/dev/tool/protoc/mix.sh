{% extends '//mix/template/proxy.sh' %}

{% block bld_libs %}
lib/protobuf/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp $(command -v protoc) ${out}/bin/
{% endblock %}
