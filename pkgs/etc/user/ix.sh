{% extends '//die/proxy.sh' %}

{% block bld_tool %}
bin/busybox
{% endblock%}

{% block run_deps %}
{% if pubkey %}
etc/sudoer(pubkey_name={{user}},pubkey_value={{pubkey}})
{% endif %}
{% endblock %}

{% block install %}
cd ${out}

mkdir -p etc/passwd.d

cat << EOF > etc/passwd.d/{{user | defined('user')}}
{{user}}:{{hash | defined('hash')}}:{{userid | defined('userid')}}:{{userid}}:none:/home/{{user}}:{{login_shell or '/bin/sh'}}
EOF

mkdir -p etc/group.d

cat << EOF > etc/group.d/{{user}}
{{user}}:x:{{userid}}:
EOF
{% endblock %}
