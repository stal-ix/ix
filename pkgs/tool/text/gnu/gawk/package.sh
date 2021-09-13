{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://mirror.tochlab.net/pub/gnu/gawk/gawk-5.1.0.tar.xz
# md5 8470c34eeecc41c1aa0c5d89e630df50
{% endblock %}

{% block deps %}
# bld lib/intl lib/iconv lib/sigsegv env/c boot/final/env
{% endblock %}

{% block cflags %}
export CPPFLAGS="-Derr=gawk_err -Dxmalloc=gawk_xmalloc -Dxrealloc=Dgawk_xrealloc -Dregcomp=gawk_regcomp -Dregfree=gawk_regfree ${CPPFLAGS}"
{% endblock %}

{% block coflags %}
--libexecdir=${out}/bin/awk_exec
--disable-extensions
{% endblock %}
