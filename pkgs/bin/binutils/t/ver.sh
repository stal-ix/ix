{% block pkg_name %}
binutils
{% endblock %}

{% block version %}
2.44
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/binutils/binutils-{{self.version().strip()}}.tar.bz2
f66390a661faa117d00fab2e79cf2dc9d097b42cc296bf3f8677d1e7b452dc3a
{% endblock %}
