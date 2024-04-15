{% extends '//bin/yggdrasil/go/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/yggdrasil
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp yggdrasil ${out}/bin/
{% endblock %}

