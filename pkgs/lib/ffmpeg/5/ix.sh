{% extends '//lib/ffmpeg/4/ix.sh' %}

# noauto

{% block pkg_name %}
ffmpeg
{% endblock %}

{% block version %}
5.1.2
{% endblock %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-{{self.version().strip()}}.tar.xz
619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd052db9e440eef3dc
{% endblock %}
