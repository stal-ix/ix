{% extends '//die/go/pure.sh' %}

{% block go_url %}
https://github.com/junegunn/fzf/archive/refs/tags/0.34.0.tar.gz
{% endblock %}

{% block go_sum %}
sha:5bfd2518f0d136a76137de799ff5911608802d23564fc26e245f25a627395ecc
{% endblock %}

{% block go_sha %}
sha:02ce6d826afb404cc0212fcad15e3e80224ece841eb247b45c03e6551d303e8a
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp fzf ${out}/bin/
{% endblock %}
