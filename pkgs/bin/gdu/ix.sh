{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gdu
{% endblock %}

{% block version %}
5.30.1
{% endblock %}

{% block go_url %}
https://github.com/dundee/gdu/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
03ac32fdeec0622790309742e48889df0709f56ca167ff1a050117bef137740d
{% endblock %}

{% block unpack %}
{{super()}}
cd cmd/gdu
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gdu ${out}/bin/
{% endblock %}
