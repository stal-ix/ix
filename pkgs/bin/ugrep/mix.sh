{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v3.7.10.tar.gz
sha:733503055e309e83898a403481d92357fc3b02d4642acdb51026dd2dd44e0477
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/lz4
lib/zstd
lib/bzip2
lib/pcre/2
{% endblock %}
