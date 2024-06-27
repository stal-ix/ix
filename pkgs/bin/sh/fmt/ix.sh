{% extends '//bin/go/sh/t/ix.sh' %}

{% block unpack %}
{{super()}}
cd cmd/shfmt
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp shfmt ${out}/bin/
{% endblock %}
