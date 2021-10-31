{% extends '//gnu/diffutils/mix.sh' %}

{% block deps %}
# bld boot/stage/4/env/mix.sh
{% endblock %}

{% block patch %}
cat << EOF > doc/Makefile.in
all:
install:
EOF
{% endblock %}
