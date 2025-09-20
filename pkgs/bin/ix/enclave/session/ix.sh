{% extends '//die/gen.sh' %}

{% block install %}
mkdir -p ${out}/bin ${out}/etc/profile.d

base64 -d << EOF > ${out}/bin/session
{% include 'session/base64' %}
EOF

cat << EOF > ${out}/etc/profile.d/00-session.sh
export LOGIN_SCRIPT=/bin/session
EOF

chmod +x ${out}/bin/*
{% endblock %}
