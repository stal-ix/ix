{% extends '//dev/lang/bison/template.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/9/m4/mix.sh
boot/9/flex/2.6.4.1.sh
boot/8/env/std/mix.sh
{% block bison %}
{% endblock %}
{% endblock %}

{% block run_deps %}
boot/9/m4/mix.sh
{% endblock %}

{% block toolconf %}
for x in perl makeinfo; do
    echo > ${x}
    chmod +x ${x}
done

cat << EOF > help2man
#!$(which dash)

touch doc/bison.1.tmp
EOF

chmod +x help2man
{% endblock %}
