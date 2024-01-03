{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/rsteube/carapace-bin/archive/refs/tags/v0.29.0.tar.gz
{% endblock %}

{% block go_sha %}
e833b7fd0ce232c04bd5c9080c962adc136aecfa95107082230bfac42c9f8371
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/carapace
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp carapace ${out}/bin/
{% endblock %}
