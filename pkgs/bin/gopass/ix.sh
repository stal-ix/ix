{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/gopasspw/gopass/archive/refs/tags/v1.14.3.tar.gz
{% endblock %}

{% block go_sha %}
c0423c287ce3e989076a625b0ca9cbe0bf0469fd1a6609e3df562cd9b961543d
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp gopass ${out}/bin/
{% endblock %}
