{% extends '//bin/etcd/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd etcdutl
{% endblock %}

{% block go_build_flags %}
{{super()}}
-o=utl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp utl ${out}/bin/etcdutl
{% endblock %}
