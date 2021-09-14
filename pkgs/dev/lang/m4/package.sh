{% extends '//util/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz
# md5 0d90823e1426f1da2fd872df0311298d
# url https://raw.githubusercontent.com/macports/macports-ports/edf0ee1e2cf/devel/m4/files/secure_snprintf.patch
# md5 319c143996239e23d2fe3e7968a7620d
{% endblock %}

{% block deps %}
# bld lib/intl lib/sigsegv dev/build/make dev/build/help2man env/std
{% endblock %}

{% block patch %}
{% if mix.platform.target.os == 'darwin' %}
patch -p0 < ${src}/secure_snprintf.patch
{% endif %}
{% endblock %}

{% block coflags %}
--disable-c++
{% endblock %}
