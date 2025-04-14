{% extends '//bin/xfsprogs/t/ix.sh' %}

{% block pkg_name %}
xfsprogs
{% endblock %}

{% block version %}
6.1.0
{% endblock %}

{% block fetch %}
https://www.kernel.org/pub/linux/utils/fs/xfs/xfsprogs/xfsprogs-{{self.version().strip()}}.tar.xz
sha:eceb9015c4ebefa56fa85faff756ccb51ed2cf9c39ba239767f8e78705e85251
{% endblock %}
