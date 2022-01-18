{% extends '//mix/template/proxy.sh' %}

{% block run_data %}
lib/curses/n/terminfo
{% endblock %}

{% block install %}
cd ${out}; mkdir -p bin; cd bin

cat << EOF > ncurses5-config
#!/usr/bin/env sh
printf "%s" "${TERMINFO}"
EOF

chmod +x ncurses5-config
{% endblock %}
