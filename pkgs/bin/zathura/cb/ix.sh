{% extends '//bin/zathura/t/ix.sh' %}

{% block fetch %}
https://git.pwmt.org/pwmt/zathura-cb/-/archive/0.1.10/zathura-cb-0.1.10.tar.bz2
sha:27ff52d4978b2d5c009ae72d62afec8719aa84829bdaea79f3cc5206d335e5fb
{% endblock %}

{% block lib_deps %}
{{super()}}
lib/archive
{% endblock %}
