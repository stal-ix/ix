{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/go-git/go-git/archive/refs/tags/v5.4.2.tar.gz
{% endblock %}

{% block go_sha %}
e09ed69954f655e8abdd78cd375531ac53a54afdb33574db65a55f80294b827a
{% endblock %}

{% block unpack %}
{{super()}}
cd cli/go-git
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp go-git ${out}/bin/
{% endblock %}
