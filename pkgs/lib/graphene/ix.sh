{% extends 't/ix.sh' %}

{% block env %}
export CPPFLAGS="-I${out}/include/graphene-1.0 -I${out}/lib/graphene-1.0/include \${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|-mfpmath.*||' -i ${out}/lib/pkgconfig/graphene-1.0.pc
{% endblock %}
