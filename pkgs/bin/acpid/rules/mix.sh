{% extends '//mix/proxy.sh' %}

{% block install %}
mkdir -p ${out}/etc/acpi; cd ${out}/etc/acpi

cat << EOF > anything
event=.*
action=/bin/sh /etc/acpi/handler.sh %e
EOF

cat << EOF > handler.sh
script="/etc/acpi/\${1}.sh"
shift
exec sh "\${script}" "\$@"
EOF

mkdir button

cat << EOF > button/lid.sh
case \${2} in
    closex) echo -n mem > /sys/power/state ;;
esac
EOF
{% endblock %}
