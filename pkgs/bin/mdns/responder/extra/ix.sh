{% extends '//bin/mdns/responder/t/t/ix.sh' %}

{% block install %}
mkdir ${out}/bin/
cp build/prod/mDNS* ${out}/bin/
{% endblock %}
