{% extends '//lib/ffmpeg/4/ix.sh' %}

# noauto

{% block pkg_name %}
ffmpeg
{% endblock %}

{% block version %}
5.1.10
{% endblock %}

{% block fetch %}
https://ffmpeg.org/releases/ffmpeg-{{self.version().strip()}}.tar.xz
392306d6fc45dab0e9e0ea55381e071842e83a2fb31d320aeda40477a7766293
{% endblock %}
