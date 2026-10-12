{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/bin
cat <<'EOF' > ${out}/bin/pg-arc-mount
#!/bin/sh
set -eu
export HOME=/home/pg USER=pg LOGNAME=pg PATH=/bin
cd "$HOME"
mkdir -p "$HOME/1"
exec /bin/arc mount -F "$HOME/1"
EOF
chmod 0755 ${out}/bin/pg-arc-mount
{% endblock %}
