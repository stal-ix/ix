{% extends '//die/proxy.sh' %}

{% block run_deps %}
bld/flex
{% endblock %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/lex
#!/usr/bin/env sh
exec flex "\${@}"
EOF
chmod +x ${out}/bin/lex
{% endblock %}
