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
exec srv agetty${i} setsid agetty --autologin root tty${i}
EOF

    chmod +x run
) done
{% endblock %}
