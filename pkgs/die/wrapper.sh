{% extends 'proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p fix; cd fix

cat << EOF > {{wrap}}
#!/usr/bin/env sh
{% block wrapper_env %}
{% endblock %}
exec {{self.wrapper().strip()}} "__realm__/bin/bin_{{wrap}}/{{wrap}}" "\$@"
EOF

cat << EOF > {{uniq_id}}-{{wrap}}.sh
mkdir -p bin/bin_{{wrap}}
mv bin/{{wrap}} bin/bin_{{wrap}}/
cat fix/{{wrap}} | sed -e "s|__realm__|\${PWD}|" > bin/{{wrap}}
chmod +x bin/{{wrap}}
EOF
{% endblock %}
