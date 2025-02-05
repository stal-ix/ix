{% extends '//die/c/autohell.sh' %}

{% block fetch %}
https://github.com/magicant/yash/releases/download/2.58.1/yash-2.58.1.tar.xz
sha:7674ece98dc77bcc753db49c4311c30532f981682205f9047f20213a3a6755bb
{% endblock %}

{% block c_rename_symbol %}
vfree
wordfree
add_history
{% endblock %}

{% block bld_tool1 %}
bld/gettext
{% endblock %}
