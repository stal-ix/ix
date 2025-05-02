{% extends '//die/go/build.sh' %}

{% block pkg_name %}
gosmee
{% endblock %}

{% block version %}
0.25.0
{% endblock %}

{% block go_url %}
https://github.com/chmouel/gosmee/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
e784c7f385ae12ef19843a2b61857fd7046ea0cbc307206da92fb635806391a9
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gosmee.bin ${out}/bin/gosmee
{% endblock %}

{% block go_build_flags %}
-o gosmee.bin
{% endblock %}

{% block go_tool %}
bin/go/lang/24
{% endblock %}
