{% extends '//bld/boot/10/bison/t/ix.sh' %}

{% block pkg_name %}
bison
{% endblock %}

{% block version %}
3.6.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/bison/bison-{{self.version().strip()}}.tar.xz
sha:67ff4539783569884cbecaf781ceb665fc92e4ef3cf44c507a49d06a87421398
{% endblock %}

{% block bison %}
bld/boot/10/bison/4
bld/boot/5/patch
{% endblock %}

{% block bison_patch %}
(base64 -d | patch -p0) << EOF
{% include 'bison.diff/base64' %}
EOF
{% endblock %}

{% block setup_target_flags %}
export CPPFLAGS="-DGRAM_error=1 ${CPPFLAGS}"
{% endblock %}
