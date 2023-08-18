{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/Genivia/ugrep/archive/refs/tags/v4.0.0.tar.gz
sha:a86e6a2ba5e833a0dcf46e115b3f103243f04e90ea6a361c65e15ceb4739803d
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/xz
lib/lz4
lib/zstd
lib/bzip/2
lib/pcre/2
{% endblock %}
