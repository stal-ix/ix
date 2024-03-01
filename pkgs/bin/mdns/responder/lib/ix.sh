{% extends '//bin/mdns/responder/t/ix.sh' %}

{% block make_target %}
libdns_sd
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp build/prod/libdns_sd.so ${out}/lib/libdns_sd.a
{% endblock %}
