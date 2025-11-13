{% block pkg_name %}
binutils
{% endblock %}

{% block version %}
2.45.1
{% endblock %}

{% block fetch %}
https://ftp.gnu.org/gnu/binutils/binutils-{{self.version().strip()}}.tar.bz2
860daddec9085cb4011279136fc8ad29eb533e9446d7524af7f517dd18f00224
{% endblock %}
