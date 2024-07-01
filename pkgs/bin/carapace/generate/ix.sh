{% extends '//bin/carapace/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/carapace-generate
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp carapace-generate ${out}/bin/
{% endblock %}
