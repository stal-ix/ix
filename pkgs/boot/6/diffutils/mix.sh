{% extends '//gnu/diffutils/mix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/5/env/std/mix.sh
{% endblock %}

{% block patch %}
cat << EOF > doc/Makefile.in
all:
install:
EOF
{% endblock %}
