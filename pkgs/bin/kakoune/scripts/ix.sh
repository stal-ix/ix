{% extends '//die/proxy.sh' %}

{% block install %}
mkdir ${out}/bin
cat << EOF > ${out}/bin/kakoune
#!/usr/bin/env sh
exec tmux new-session kak "\${@}"
EOF
chmod +x ${out}/bin/*
{% endblock %}
