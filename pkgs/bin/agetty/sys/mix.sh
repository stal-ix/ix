{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/agetty
{% endblock %}

{% block install %}
cd ${out}

mkdir -p etc/services; cd etc/services

for i in 1 2 3 4 5; do (
    mkdir agetty${i}; cd agetty${i}

    cat << EOF > run
#!/bin/sh
mkdir -p /var/run/agetty${i}
cd /var/run/agetty${i}
exec cttyhack agetty --autologin root tty${i} 1>stdout 2>stderr
EOF

    chmod +x run
) done
{% endblock %}
