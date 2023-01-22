{% extends '//bin/openssh/t/ix.sh' %}

{% block patch %}
{{super()}}
sed -e 's|host-key:|host-key-xxx:|' -i Makefile.in
echo 'host-key:' >> Makefile.in
{% endblock %}

{% block install %}
{{super()}}
rm -r ${out}/etc ${out}/share
rm ${out}/bin/sshd
{% endblock %}
