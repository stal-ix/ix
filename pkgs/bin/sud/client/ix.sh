{% extends '//bin/openssh/client/ix.sh' %}

{% block build_flags %}
compress
{% endblock %}

{% block install %}
{{super()}}
cd ${out}
mv bin old
mkdir bin
mv old/ssh bin/sud_client
rm -r old
{% endblock %}

{% block cpp_defines %}
{{super()}}
_GNU_SOURCE=1
{% endblock %}
