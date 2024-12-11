{% extends 'base.sh' %}

{% block bld_deps %}
bld/boot/10/m4
bld/boot/10/flex/3
bld/boot/9/env/std
{% block bison %}
{% endblock %}
{% endblock %}

{% block run_deps %}
bld/boot/10/m4
{% endblock %}

{% block setup_tools %}
for x in perl makeinfo; do
    echo > ${x}
    chmod +x ${x}
done

cat << EOF > help2man
#!$(which sh)
touch doc/bison.1.tmp
EOF

chmod +x help2man
{% endblock %}
