{% extends '//gnu/findutils/package.sh' %}

{% block deps %}
# bld boot/stage/4/env/package.sh
{% endblock %}

{% block patch %}
cat << EOF > doc/Makefile.in
all:
install:
EOF
{% endblock %}
