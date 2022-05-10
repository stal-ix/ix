{% extends '//bin/coreutils/8/31/mix.sh' %}

{% block bld_libs %}
bld/boot/4/lib/compiler_rt
{% endblock %}

{% block bld_deps %}
bld/boot/4/patch
bld/boot/4/byacc
bld/boot/4/mawk
bld/boot/3/env
{% endblock %}

{% block setup_tools %}
cat << EOF > makeinfo
#!$(which sh)
EOF

chmod +x makeinfo
{% endblock %}

{% block cpp_includes %}
${PWD}/lib
{% endblock %}

{% block setup %}
export PATH="${PWD}/src:${PATH}"
{% endblock %}
