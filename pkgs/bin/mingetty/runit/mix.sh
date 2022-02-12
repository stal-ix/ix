{% extends '//mix/template/proxy.sh' %}

{% block run_deps %}
bin/fixtty
bin/mingetty
{% endblock %}

{% block install %}
cd ${out}; mkdir -p etc/services; cd etc/services

for i in 1 2 3; do (
    mkdir mingetty${i}; cd mingetty${i}

    cat << EOF > daemon
#!/bin/sh
fixtty /dev/tty${i}
exec setsid mingetty tty${i}
EOF

    cat << EOF > run
#!/bin/sh
exec srv mingetty${i} ${PWD}/daemon
EOF

    chmod +x run daemon
) done

for i in 4; do (
    mkdir mingetty${i}; cd mingetty${i}

    cat << EOF > daemon
#!/bin/sh
fixtty /dev/tty${i}
exec setsid mingetty --autologin root tty${i}
EOF

    cat << EOF > run
#!/bin/sh
exec srv mingetty${i} ${PWD}/daemon
EOF

    chmod +x run daemon
) done
{% endblock %}
