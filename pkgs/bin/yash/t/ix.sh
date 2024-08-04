{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/magicant/yash/releases/download/2.57/yash-2.57.tar.xz
sha:f5ff3334dcfa0fdde3882f5df002623f46a0a4f2b2335e7d91715520d8fb1dab
{% endblock %}

{% block c_rename_symbol %}
vfree
wordfree
add_history
{% endblock %}
