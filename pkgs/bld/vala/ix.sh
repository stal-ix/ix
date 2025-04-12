{% extends '//die/std/ix.sh' %}

{% block version %}
0.56.1
{% endblock %}

{% block fetch %}
https://gitlab.gnome.org/GNOME/vala/-/archive/{{self.version().strip()}}/vala-{{self.version().strip()}}.tar.bz2
sha:e9dd6b2bf0298948fddc0ddb5c813f7cfd8db2e8557fd938d1e620a207fc2b16
{% endblock %}

{% block install %}
mkdir -p ${out}/share/aclocal
find . -type f -name '*m4' | while read l; do
    cp ${l} ${out}/share/aclocal/
done
{% endblock %}
