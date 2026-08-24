{% extends '//die/go/build.sh' %}

{% block pkg_name %}
dive
{% endblock %}

{% block version %}
0.13.1
{% endblock %}

{% block go_url %}
https://github.com/wagoodman/dive/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
b110bfe7b8d9da89bcf085b68251c44d50201ff9f169842ef6d110f6ab24d201
{% endblock %}

{% block go_build_flags %}
{{super()}}
-o dive_bin
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp dive_bin ${out}/bin/dive
{% endblock %}

{% block go_tool %}
bin/go/lang/25
{% endblock %}
