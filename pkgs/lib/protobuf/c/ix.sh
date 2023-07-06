{% extends 't/ix.sh' %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block configure_flags %}
{{super()}}
--disable-protoc
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|bindir=.*||' -i ${out}/lib/pkgconfig/libprotobuf-c.pc
{% endblock %}
