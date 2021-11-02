{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz
# md5 0d90823e1426f1da2fd872df0311298d
{% endblock %}

{% block bld_deps %}
lib/intl/mix.sh
lib/sigsegv/mix.sh
dev/build/help2man/mix.sh
env/autohell/mix.sh
{% endblock %}

{% block coflags %}
--disable-c++
{% endblock %}
