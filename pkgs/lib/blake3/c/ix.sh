{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/BLAKE3-team/BLAKE3/archive/refs/tags/1.5.1.tar.gz
sha:822cd37f70152e5985433d2c50c8f6b2ec83aaf11aa31be9fe71486a91744f37
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}

{% block unpack %}
{{super()}}
cd c
{% endblock %}
