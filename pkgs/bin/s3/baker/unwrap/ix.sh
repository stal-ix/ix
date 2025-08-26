{% extends '//die/c/autorehell.sh' %}

{% block pkg_name %}
s3backer
{% endblock %}

{% block version %}
2.1.6
{% endblock %}

{% block fetch %}
https://github.com/archiecobbs/s3backer/archive/refs/tags/{{self.version().strip()}}.tar.gz
52f6257d3ca2b17d51d8c7a2c4c96cb0bcfdb55e4cbb9a27622c0028a521a2fb
{% endblock %}

{% block bld_libs %}
lib/c
lib/zstd
lib/curl
lib/expat
lib/fuse/3
lib/bsd/overlay
{% endblock %}

{% block bld_tool %}
bld/fakegit
{% endblock %}
