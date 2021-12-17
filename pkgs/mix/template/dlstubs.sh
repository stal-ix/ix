{% extends 'c_std.sh' %}

{% block std_box %}
lib/dlfcn/scripts/mix.sh
{{super()}}
{% endblock %}

{% block step_unpack %}
echo 'skip unpack'
{% endblock %}

{% block build %}
(
    set -eu

    cat << EOF
{% block export_symbols %}
{% endblock %}
EOF

{% block export_symbols_sh %}
{% endblock %}
) | dl_stubs {{self.export_lib().strip()}} > dl.cpp

${CC} -c dl.cpp
{% endblock %}

{% block install %}
mkdir ${out}/lib && cp dl.o ${out}/lib/
{% endblock %}

{% block env %}
export LDFLAGS="${out}/lib/dl.o \${LDFLAGS}"
{% endblock %}
