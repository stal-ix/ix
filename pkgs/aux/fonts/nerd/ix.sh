{% extends '//die/fonts.sh' %}

{% block pkg_name %}
nerd-fonts
{% endblock %}

{% block version %}
3.3.0
{% endblock %}

{% block fetch %}
https://github.com/ryanoasis/nerd-fonts/releases/download/v{{self.version().strip()}}/NerdFontsSymbolsOnly.zip
sha:2078603c1e7a2fc2fa9e625ba1c30264d5d7c39907813d89beaa373f73a3a340
{% endblock %}

{% block skip_dirs %}0{% endblock %}
