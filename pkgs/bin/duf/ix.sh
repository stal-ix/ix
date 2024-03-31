{% extends '//die/go/build.sh' %}

{% block go_url %}
https://github.com/muesli/duf/archive/refs/tags/v0.8.1.tar.gz
{% endblock %}

{% block go_sha %}
87e574a7c998142ee1e9b1b57062edfba4fe0ee1308def9d386b71e6abc5c119
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp duf ${out}/bin/
{% endblock %}

{% block go_version %}
v3
{% endblock %}
