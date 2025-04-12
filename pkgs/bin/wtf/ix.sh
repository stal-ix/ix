{% extends '//die/go/build.sh' %}

{% block pkg_name %}
wtf
{% endblock %}

{% block version %}
0.41.0
{% endblock %}

{% block go_url %}
https://github.com/wtfutil/wtf/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
0cf27a0b438cb6d4f25806cb3f407c99d1f3a0722305347effda92715e11fdba
{% endblock %}

{% block go_build_flags %}
-o wtfutil
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp wtfutil ${out}/bin/
{% endblock %}
