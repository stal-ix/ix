{% extends '//die/c/autorehell.sh' %}

{% block fetch %}
https://github.com/mm2/Little-CMS/archive/refs/tags/lcms2.12.tar.gz
sha:e90e77e43be35ec149d39f1ee7fe1c50c73309773a55b13839090f7138fbdcde
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
