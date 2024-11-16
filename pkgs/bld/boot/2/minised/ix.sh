{% extends '//die/c/ix.sh' %}

{% block fetch %}
http://dl.exactcode.de/oss/minised/minised-1.16.tar.gz
sha:46e072d5d45c9fd3d5b268523501bbea0ad016232b2d3f366a7aad0b1e7b3f71
{% endblock %}

{% block bld_libs %}
bld/boot/0/ind
{% endblock %}

{% block bld_deps %}
bld/boot/2/sbase
bld/boot/1/env
{% endblock %}

{% block unpack %}
mkdir src
cd src
extract0 ${src}/minised*
cd minised*
{% endblock %}

{% block build %}
mkdir -p ${out}/bin
${CC} ${CPPFLAGS} ${CFLAGS} ${LDFLAGS} *.c -o ${out}/bin/sed
{% endblock %}

{% block env %}
export ac_cv_path_SED=sed
{% endblock %}

{% block script_exec %}
["/usr/bin/env", "PATH={{ix_boot_path}}", "/bin/sh", "-s"]
{% endblock %}
