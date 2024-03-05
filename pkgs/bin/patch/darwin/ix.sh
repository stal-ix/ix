{% extends '//die/c/pmake.sh' %}

{% block fetch %}
https://github.com/apple-oss-distributions/patch_cmds/archive/refs/tags/patch_cmds-61.tar.gz
sha:ac3934304c25be001a189c26a7cd01dfa3817d0a0f6a25aafd3e1649489b047d
{% endblock %}

{% block unpack %}
{{super()}}
cd patch
{% endblock %}

{% block bld_libs %}
lib/c
lib/bsd/overlay
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block bld_tool %}
bin/gzip
{% endblock %}

{% block cpp_missing %}
fcntl.h
unistd.h
sys/stat.h
{% endblock %}

{% block cpp_defines %}
d_namlen=d_reclen
st_mtimespec=st_mtim
__APPLE__
{% endblock %}

{% block patch %}
sed -e 's|util.c|util.c vcs.c|' -i Makefile
{% endblock %}

{% block setup_target_flags %}
{{super()}}
export OPTFLAGS="${OPTFLAGS} -UNDEBUG"
{% endblock %}
