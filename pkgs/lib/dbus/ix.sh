{% extends 't/ix.sh' %}

{% block install %}
{{super()}}
sed -e 's|.*bindir.*||' -e 's|-DDBUS_STATIC_BUILD||' -i ${out}/lib/pkgconfig/dbus-1.pc
rm -rf ${out}/lib/lib_*
{% endblock %}

{% block env %}
export CPPFLAGS="-I${out}/include/dbus-1.0 -I${out}/lib/dbus-1.0/include \${CPPFLAGS}"
{% endblock %}
