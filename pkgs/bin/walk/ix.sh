{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/antonmedv/walk/archive/refs/tags/v1.5.2.tar.gz
{% endblock %}

{% block go_sha %}
e8a200e9255d4fedc6623cb9ad76de70ce882cf02b92362225533c9e9ca6500d
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp walk ${out}/bin/
{% endblock %}
