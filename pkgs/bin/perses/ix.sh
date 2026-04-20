{% extends '//die/c/make.sh' %}

{% block pkg_name %}
perses
{% endblock %}

{% block version %}
0.53.1
{% endblock %}

{% block fetch %}
https://github.com/perses/perses/releases/download/v{{self.version().strip()}}/perses_{{self.version().strip()}}_linux_amd64.tar.gz
126aec7cad521abf1536d125790e0542f5a4fbc3770b5de6f1c32e922cec1456
{% endblock %}

{% block skip_dirs %}0{% endblock %}

{% block configure %}
{% endblock %}

{% block build %}
{% endblock %}

{% block install %}
mkdir -p ${out}/bin
cp perses ${out}/bin/
cp percli ${out}/bin/
{% endblock %}
