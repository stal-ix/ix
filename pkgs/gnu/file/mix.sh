{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
http://deb.debian.org/debian/pool/main/f/file/file_5.39.orig.tar.gz
1c450306053622803a25647d88f80f25
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block postinstall %}
rm -rf ${out}/lib ${out}/include
{% endblock %}
