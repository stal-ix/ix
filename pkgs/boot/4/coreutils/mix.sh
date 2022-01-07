{% extends '//gnu/coreutils/8/31/mix.sh' %}

{% block bld_libs %}
boot/4/lib/compiler_rt
{% endblock %}

{% block bld_deps %}
boot/4/patch
boot/4/byacc
boot/4/mawk
boot/3/env
{% endblock %}

{% block setup_tools %}
cat << EOF > makeinfo
#!$(which sh)
EOF

chmod +x makeinfo
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${PWD}/lib ${CPPFLAGS}"
export PATH="${PWD}/src:${PATH}"
{% endblock %}
