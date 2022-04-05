{% extends 'base.sh' %}

{% block bld_deps %}
boot/9/m4
boot/9/flex/2.6.4.1.sh
boot/8/env/std
{% block bison %}
{% endblock %}
{% endblock %}

{% block run_deps %}
boot/9/m4
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
