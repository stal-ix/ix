{% extends '//die/autohell.sh' %}

{% block fetch %}
http://mirror.koddos.net/gcc/releases/gcc-11.2.0/gcc-11.2.0.tar.xz
31c86f2ced76acac66992eeedce2fce2
{% endblock %}

{% block lib_deps %}
lib/c/naked
{% endblock %}

{% block bld_tool %}
bld/python
{% endblock %}

{% block unpack %}
{{super()}}
mkdir bld; cd bld
{% endblock %}

{% block configure_script %}
../libstdc++*/configure
{% endblock %}

{% block configure_flags %}
--disable-multilib
--enable-linux-futex=no
--enable-libstdcxx-dual-abi=no
{% endblock %}

{% block configure_cross %}
--build=x86_64-pc-linux
--host=x86_64-pc-linux-musl
{% endblock %}

{% block cpp_defines %}
__builtin_ia32_rdseed_si_step=__builtin_ia32_rdseed32_step
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block setup %}
export CFLAGS="-mrdrnd -mrdseed ${CFLAGS}"
{% endblock %}

{% block setup_tools %}
CL=$(which clang++)

cat << EOF > clang++
#!$(which python3)
import sys
import subprocess

def it():
    yield from sys.argv[1:]

    if '++98' not in str(sys.argv):
        yield '-faligned-allocation'
        yield '-faligned-new'
        yield '-fsized-deallocation'

    if 'memory_resource.cc' in str(sys.argv):
        yield '-std=c++20'
        yield '-D__constinit=constinit'

subprocess.check_call(["${CL}"] + list(it()))
EOF

chmod +x clang++
{% endblock %}

{% block env_lib %}
export CPPFLAGS="-I${out}/include/c++/11.2.0/x86_64-pc-linux-musl -I${out}/include/c++/11.2.0 \${CPPFLAGS}"
{% endblock %}

{% block install %}
{{super()}}
rm ${out}/lib/libstdc++.a-gdb.py
{% endblock %}
