{% extends '//bin/openssh/t/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/sshd bin/
rm -rf old
{% endblock %}
