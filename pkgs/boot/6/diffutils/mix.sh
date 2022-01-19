{% extends '//bin/diffutils/mix.sh' %}

{% block bld_libs %}
{% endblock %}

{% block bld_deps %}
boot/5/env/std
{% endblock %}

{% block patch %}
cat << EOF > doc/Makefile.in
all:
install:
EOF
{% endblock %}
