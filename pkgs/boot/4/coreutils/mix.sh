{% extends '//gnu/coreutils/8.31/mix.sh' %}

{% block bld_deps %}
boot/4/patch/mix.sh
boot/4/byacc/mix.sh
boot/4/mawk/mix.sh
boot/3/env/mix.sh
{% endblock %}

{% block toolconf %}
cat << EOF > makeinfo
#!$(command -v dash)
EOF

chmod +x makeinfo
{% endblock %}

{% block cflags %}
export CPPFLAGS="-I${PWD}/lib ${CPPFLAGS}"
export PATH="${PWD}/src:${PATH}"
{% endblock %}
