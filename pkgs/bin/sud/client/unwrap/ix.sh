{% extends '//bin/openssh/ix.sh' %}

{% block bld_tool %}
bin/upx
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/ssh bin/sud_client
rm -rf old share etc var
upx ${out}/bin/sud_client
{% endblock %}
