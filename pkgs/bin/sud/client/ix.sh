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

{% block setup %}
export CPPFLAGS="-D_GNU_SOURCE=1 -Wno-implicit-function-declaration ${CPPFLAGS}"
{{super()}}
{% endblock %}
