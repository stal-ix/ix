{% extends '//bin/openssh/t/ix.sh' %}

{% block patch %}
{{super()}}
# disable host key generation
sed -e 's|host-key:|host-key-xxx:|' -i Makefile.in
echo 'host-key:' >> Makefile.in
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/etc ${out}/share
rm ${out}/bin/sshd
{% endblock %}
