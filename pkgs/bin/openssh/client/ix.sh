{% extends '//bin/openssh/t/ix.sh' %}

{% block install %}
{{super()}}
rm -r ${out}/etc ${out}/share
rm ${out}/bin/sshd
{% endblock %}
