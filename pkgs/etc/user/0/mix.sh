{% extends '//mix/proxy.sh' %}

{% block bld_tool %}
bin/busybox
{% endblock%}

{% block install %}
cd ${out}

mkdir -p etc/passwd.d

cat << EOF > etc/passwd.d/user0
{{user or error()}}:$(echo | cryptpw -S 237364527348):10000:10000:none:/home/{{user}}:/home/{{user}}/.session
EOF

{% if pubkey %}
mkdir -p etc/sud.d

cat << EOF > etc/sud.d/{{user}}
{{pubkey}}
EOF
{% endif %}
{% endblock %}
