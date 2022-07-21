{% extends '//die/cgo.sh' %}

{% block fetch %}
https://github.com/wtfutil/wtf/archive/refs/tags/v0.41.0.tar.gz
sha:e01f45aaa7a1e31ab555071763da184d611f87b1800265dc782502da9c985eaf
{% endblock %}

{% block go_build_flags %}
-o wtfutil
{% endblock %}

{% block install %}
mkdir ${out}/bin
cp wtfutil ${out}/bin/
{% endblock %}
