{% extends '//bin/openssh/mix.sh' %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/ssh bin/sud_client
rm -rf old share etc var
{% endblock %}
