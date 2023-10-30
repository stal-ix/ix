{% extends '//bin/etcd/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd server
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp server ${out}/bin/etcd
{% endblock %}
