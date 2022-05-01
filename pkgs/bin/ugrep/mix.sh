{% extends '//mix/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v3.7.9.tar.gz
sha:016e771756574a2a0b026ec50f7e7f3898d39cb61771ce98bc225c34d86a03be
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
