{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url http://www.ivarch.com/programs/sources/pv-1.6.6.tar.bz2
# md5 ff3564fddcc2b9bd4a9c1d143aba4b4c
{% endblock %}

{% block deps %}
# bld {{'dev/lang/cctools/package.sh' | darwin}}
# bld dev/build/make/package.sh
# bld env/tools/package.sh
# bld env/c/package.sh
# bld env/bootstrap/package.py
{% endblock %}

{% block cflags %}
{% if mix.platform.target.os == 'darwin' %}
export CPPFLAGS="-Dstat64=stat -Dfstat64=fstat -Dlstat64=lstat ${CPPFLAGS}"
{% endif %}

export LD=ld
{% endblock %}

{% block toolconf %}
{% if mix.platform.target.os == 'linux' %}
ln -s $(command -v ld.lld) ld
{% endif %}
{% endblock %}
