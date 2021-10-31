{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/tar/tar-1.34.tar.xz
# md5 9a08d29a9ac4727130b5708347c0f5cf
{% endblock %}

{% block deps %}
# bld lib/z/package.sh
# bld lib/xz/package.sh
# bld lib/intl/package.sh
# bld lib/bzip2/package.sh
# bld lib/iconv/package.sh
# bld dev/build/make/package.sh
# bld env/std/package.sh
{% endblock %}
