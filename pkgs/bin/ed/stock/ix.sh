{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/ed/ed-1.20.2.tar.lz
sha:65fec7318f48c2ca17f334ac0f4703defe62037bb13cc23920de077b5fa24523
{% endblock %}

{% block bld_libs %}
lib/c
lib/intl
lib/sigsegv
{% endblock %}
