{% extends '//gnu/findutils/mix.sh' %}

{% block bld_deps %}
boot/5/env/std/mix.sh
{% endblock %}

{% block patch_findutils %}
cat << EOF > doc/Makefile.in
all:
install:
EOF
{% endblock %}
