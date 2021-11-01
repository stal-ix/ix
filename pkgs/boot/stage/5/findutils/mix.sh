{% extends '//gnu/findutils/mix.sh' %}

{% block bld_deps %}
boot/stage/4/env/mix.sh
{% endblock %}

{% block patch %}
cat << EOF > doc/Makefile.in
all:
install:
EOF
{% endblock %}

{% block check_tools %}
{% endblock %}
