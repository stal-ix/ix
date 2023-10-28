{% extends '//bin/etcd/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd etcdctl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp etcdctl ${out}/bin/
{% endblock %}
