{% extends '//bin/openssh/ix.sh' %}

{% block bld_tool %}
bld/pack
{{super()}}
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/ssh bin/sud_client
rm -rf old share etc var
packexe ${out}/bin/sud_client
{% endblock %}
