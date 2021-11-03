{% extends '//gnu/findutils/mix.sh' %}

{% block bld_deps %}
boot/stage/5/env/mix.sh
{% endblock %}

{% block patch_findutils %}
cat << EOF > doc/Makefile.in
all:
install:
EOF
{% endblock %}
