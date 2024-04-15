{% extends '//bin/yggdrasil/go/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/genkeys
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp genkeys ${out}/bin/
{% endblock %}

