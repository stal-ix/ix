{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
# url https://ftp.gnu.org/gnu/tar/tar-1.34.tar.xz
# md5 9a08d29a9ac4727130b5708347c0f5cf
{% endblock %}

{% block bld_deps %}
lib/z/mix.sh
lib/xz/mix.sh
lib/intl/mix.sh
lib/bzip2/mix.sh
lib/iconv/mix.sh
env/autohell/mix.sh
{% endblock %}
