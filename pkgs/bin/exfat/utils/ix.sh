{% extends '//die/c/autorehell.sh' %}

{% block version %}
1.4.0
{% endblock %}

{% block fetch %}
https://github.com/relan/exfat/releases/download/v{{self.version().strip()}}/exfat-utils-{{self.version().strip()}}.tar.gz
sha:241575fa93104406a47e79e53e4d907bae69886f11621f70a45276c62b75bf69
{% endblock %}

{% block bld_libs %}
lib/c
lib/fuse/2
{% endblock %}
