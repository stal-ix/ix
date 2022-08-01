{% extends '//die/go/pure.sh' %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block go_url %}
https://github.com/tvrzna/emptty/archive/864c0ec71bdb9309b0458fdaae141654ad04aa93.tar.gz
{% endblock %}

{% block go_sum %}
sem:17a33795aee47d65721505bf6bb011d3638cfa46d1af313cc79eba8e452a3b97
{% endblock %}

{% block go_sha %}
sha:aca8f19bf101fc0e49b7f13ac1d45576f9319282b27fb7a44d02b0f480c93b99
{% endblock %}

{% block go_tags %}
nopam
noxlib
noutmp
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp emptty ${out}/bin/
{% endblock %}
