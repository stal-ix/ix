{% extends '//die/c/ix.sh' %}

{% block bld_libs %}
lib/c
bin/mrustc/std
lib/shim/fake(lib_name=gcc_s)
lib/shim/fake(lib_name=atomic)
{% endblock %}

{% block step_unpack %}
:
{% endblock %}

{% block bld_tool %}
#bin/strace
bin/mrustc
{% endblock %}

{% block build %}
set -xue
export MRUSTC_PATH=$(which mrustc)
export MRUSTC_LIBDIR=${tmp}
cd ${tmp}
cp -R {{dir}} ./qw
cd qw
minicargo -L ${MRUSTC_STD} --vendor-dir ${PWD}/vendor .
{% endblock %}

{% block install %}
:
{% endblock %}
