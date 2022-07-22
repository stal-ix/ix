{% extends '//bin/emptty/stock/ix.sh' %}

{% block patch %}
sed -e 's|env: Xorg|env: Wayland|' -i src/desktop.go
{% endblock %}
