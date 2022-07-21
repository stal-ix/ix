{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/AbiWord/enchant/releases/download/v2.3.3/enchant-2.3.3.tar.gz
sha:3da12103f11cf49c3cf2fd2ce3017575c5321a489e5b9bfa81dd91ec413f3891
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/glib
{% endblock %}
