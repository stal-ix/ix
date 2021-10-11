{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz
# md5 0d90823e1426f1da2fd872df0311298d
{% endblock %}

{% block deps %}
# bld lib/intl lib/sigsegv dev/build/make dev/build/help2man env/std
{% endblock %}

{% block coflags %}
--disable-c++
{% endblock %}
