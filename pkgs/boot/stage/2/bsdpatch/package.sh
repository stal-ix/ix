{% extends '//util/template.sh' %}

{% block fetch %}
# url https://opensource.apple.com/tarballs/patch_cmds/patch_cmds-17.tar.gz
# md5 4740086061c91069efcfbf4fde458ead
{% endblock %}

{% block deps %}
# bld boot/stage/2/shutil boot/stage/1/env
{% endblock %}

{% block build %}
mkdir -p ${out}/bin
clang ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} *.c -o ${out}/bin/patch
{% endblock %}
