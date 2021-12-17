{% extends '//boot/9/bison/template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.6.1.tar.xz
16fa3e60f2c33888c6ef7af64c89e182
{% endblock %}

{% block bison %}
boot/9/bison/3.5.1_1.sh
boot/4/patch/mix.sh
{% endblock %}

{% block bison_patch %}
(base64 -d | patch -p0) << EOF
{% include 'bison.diff/base64' %}
EOF
{% endblock %}

{% block setup %}
export CPPFLAGS="-DGRAM_error=1 ${CPPFLAGS}"
{% endblock %}
