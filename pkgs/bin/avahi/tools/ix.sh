{% extends '//bin/avahi/t/ix.sh' %}

{% block install %}
{{super()}}
rm -rf ${out}/bin/avahi-daemon
rm -rf ${out}/bin/avahi-autoipd
rm -rf ${out}/bin/avahi-dnsconfd
rm -rf ${out}/etc
{% endblock %}
