{% extends '//die/hub.sh' %}

{% block run_deps %}
bld/boot/3/bt
bld/boot/8/env/box
bld/extract/scripts(std_env=bld/boot/9/env/cxx/0,boot=1)
bin/bsdtar/lite(std_env=bld/boot/9/env/cxx/0,zlib_ver=adler,execinfo_ver=fake,libc_lite=1,boot=1)
{% endblock %}
