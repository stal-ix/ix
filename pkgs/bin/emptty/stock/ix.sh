{% extends '//die/go/c.sh' %}

{# TODO(pg): get rid of /usr/bin/getent reference #}

{% block fetch %}
https://github.com/tvrzna/emptty/archive/864c0ec71bdb9309b0458fdaae141654ad04aa93.tar.gz
#sem:17a33795aee47d65721505bf6bb011d3638cfa46d1af313cc79eba8e452a3b97
#sem:851938f570909bd7315452e020b5ee1b8470939cacee0645ca4624d238a3a686
sha:851938f570909bd7315452e020b5ee1b8470939cacee0645ca4624d238a3a686
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
