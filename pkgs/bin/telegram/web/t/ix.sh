{% extends '//die/proxy.sh' %}

{% block run_deps %}
bin/webview
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block install %}
mkdir ${out}/bin; cd ${out}/bin

cat << EOF > telegram
#!/usr/bin/env sh
exec webview https://web.telegram.org/{{self.flavor().strip()}}
EOF

chmod +x telegram
{% endblock %}
