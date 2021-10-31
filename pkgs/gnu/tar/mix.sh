{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/tar/tar-1.34.tar.xz
# md5 9a08d29a9ac4727130b5708347c0f5cf
{% endblock %}

{% block deps %}
# bld lib/z/mix.sh
# bld lib/xz/mix.sh
# bld lib/intl/mix.sh
# bld lib/bzip2/mix.sh
# bld lib/iconv/mix.sh
# bld dev/build/make/mix.sh
# bld env/std/mix.sh
{% endblock %}
