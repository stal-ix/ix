{% extends '//die/go/build.sh' %}

{% block pkg_name %}
ipget
{% endblock %}

{% block version %}
0.10.0
{% endblock %}

{% block go_url %}
https://github.com/ipfs/ipget/archive/refs/tags/v{{self.version().strip()}}.tar.gz
{% endblock %}

{% block go_sha %}
1ce26f4c4532e1b7b98d99f0f9f18074c86b6f5ac0aefe928f5dc98fcb3ec22f
{% endblock %}

{% block go_compiler %}
bin/go/lang/20
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp ipget ${out}/bin/
{% endblock %}
