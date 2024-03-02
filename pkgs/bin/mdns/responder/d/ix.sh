{% extends '/bin/mdns/responder/t/t/ix.sh' %}

{% block install %}
mkdir -p ${out}/share/mdns ${out}/sbin ${out}/bin ${out}/lib ${out}/include ${out}/man/man8
{{super()}}
mv ${out}/sbin/* ${out}/bin/
rm -rf ${out}/sbin
{% endblock %}
