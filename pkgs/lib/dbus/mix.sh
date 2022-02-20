{% extends '//lib/dbus/t/mix.sh' %}

{% block install %}
{{super()}}
sed -e 's|.*bindir.*||' -i ${out}/lib/pkgconfig/dbus-1.pc
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/dbus-1.0 \${CPPFLAGS}"
{% endblock %}
