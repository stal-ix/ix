{% extends '//lib/musl/pure/ix.sh' %}

{% block install %}
{{super()}}
cd ${out}/lib
mv libc.a libmusl.a
cp libm.a libc.a
{% endblock %}
