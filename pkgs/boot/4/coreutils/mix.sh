{% extends '//gnu/coreutils/8/31/mix.sh' %}

{% block bld_libs %}
boot/4/lib/compiler_rt/mix.sh
{% endblock %}

{% block bld_deps %}
boot/4/patch/mix.sh
boot/4/byacc/mix.sh
boot/4/mawk/mix.sh
boot/3/env/mix.sh
{% endblock %}

{% block setup_tools %}
cat << EOF > makeinfo
#!$(which dash)
EOF

chmod +x makeinfo
{% endblock %}

{% block setup %}
export CPPFLAGS="-I${PWD}/lib ${CPPFLAGS}"
export PATH="${PWD}/src:${PATH}"
{% endblock %}
