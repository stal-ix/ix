{% extends 'template.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-3.6.1.tar.xz
sha:67ff4539783569884cbecaf781ceb665fc92e4ef3cf44c507a49d06a87421398
{% endblock %}

{% block bison %}
bld/boot/9/bison/3.5.1_1.sh
bld/boot/4/patch
{% endblock %}

{% block bison_patch %}
(base64 -d | patch -p0) << EOF
{% include 'bison.diff/base64' %}
EOF
{% endblock %}

{% block setup %}
export CPPFLAGS="-DGRAM_error=1 ${CPPFLAGS}"
{% endblock %}
