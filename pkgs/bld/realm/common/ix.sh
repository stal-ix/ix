{% extends '//die/gen.sh' %}

{% block run_deps %}
bld/sh
bld/box
bld/python
{% endblock %}

{% block install %}
cd ${out}; mkdir bin; cd bin

base64 -d << EOF > {{'prepare_realm.py' if all_system else 'prepare_realm'}}
{% include 'realm.py/base64' %}
EOF

{% if all_system %}
cat << 'EOF' > prepare_realm
#!/usr/bin/env sh
export PATH="{{system_path or '/usr/local/bin:/usr/bin:/bin'}}:${PATH}"
exec python3 "$(dirname "$0")/prepare_realm.py" "$@"
EOF
{% endif %}

chmod +x *
{% endblock %}
