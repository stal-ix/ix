{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz
# md5 0d90823e1426f1da2fd872df0311298d
{% endblock %}

{% block deps %}
# bld lib/intl/package.sh
# bld lib/sigsegv/package.sh
# bld dev/build/make/package.sh
# bld dev/build/help2man/package.sh
# bld env/std/package.sh
{% endblock %}

{% block coflags %}
--disable-c++
{% endblock %}
