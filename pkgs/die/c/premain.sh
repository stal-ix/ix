{% extends 'ix.sh' %}

{% block shell %}
bin/bash/lite/sh
{% endblock %}

{% block step_unpack %}
: nothing to unpack
{% endblock %}

{% block build %}
set -xue -o pipefail

(
set -xue -o pipefail

cat << EOF
{% block premain_code %}
{% endblock %}
EOF

{% block premain_code_gen %}
{% endblock %}
) | cc -c -o reg.o -x {% block premain_lang %}c{% endblock %} -
{% endblock %}

{% block install %}
mkdir ${out}/lib
cp reg.o ${out}/lib/
{% endblock %}

{% block env %}
export CTRFLAGS="${out}/lib/reg.o \${CTRFLAGS}"
{% endblock %}
