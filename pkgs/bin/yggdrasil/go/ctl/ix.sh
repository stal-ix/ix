{% extends '//bin/yggdrasil/go/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/yggdrasilctl
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp yggdrasilctl ${out}/bin/
{% endblock %}

