{% extends '//die/proxy.sh' %}

{% block install %}
cd ${out}; mkdir -p fix; cd fix

cat << EOF > {{uniq_id}}-{{wrap}}
#!/usr/bin/env sh
{% block wrapper_env %}
{% endblock %}
exec {{self.wrapper().strip()}} "__realm__/bin/bin_{{uniq_id}}/{{wrap}}" "\$@"
EOF

cat << EOF > {{uniq_id}}-{{wrap}}.sh
set -uex
mkdir -p bin/bin_{{uniq_id}}
mv bin/{{wrap}} bin/bin_{{uniq_id}}/
cat fix/{{uniq_id}}-{{wrap}} | sed -e "s|__realm__|\${PWD}|" > bin/{{wrap}}
chmod +x bin/{{wrap}}
EOF
{% endblock %}
