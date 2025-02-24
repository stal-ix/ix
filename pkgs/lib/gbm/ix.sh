{% extends '//die/hub.sh' %}

{% block lib_deps %}
lib/drm
lib/gbm/loader
lib/gbm/headers
lib/shim/fake/pkg(pkg_name=dri,pkg_ver=100500)
lib/shim/fake/pkg(pkg_name=gbm,pkg_ver=100500)
{% endblock %}
