{% extends '//tool/text/gnu/diffutils/package.sh' %}

{% block deps %}
# bld boot/stage/4/env
{% endblock %}

{% block patch %}
cat << EOF > doc/Makefile.in
all:
install:
EOF
{% endblock %}
