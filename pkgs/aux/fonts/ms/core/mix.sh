{% extends '//mix/fonts.sh' %}

{% block fetch %}
https://sourceforge.net/projects/corefonts/files/the%20fonts/final/wd97vwr32.exe
sha:f61126a6d17b2d126a7f31b142504dce4934f7989c55f1c13c6477b3fe80b3d2
https://sourceforge.net/projects/corefonts/files/the%20fonts/final/webdin32.exe
sha:64595b5abc1080fba8610c5c34fab5863408e806aafe84653ca8575bed17d75a
https://sourceforge.net/projects/corefonts/files/the%20fonts/final/verdan32.exe
sha:c1cb61255e363166794e47664e2f21af8e3a26cb6346eb8d2ae2fa85dd5aad96
https://sourceforge.net/projects/corefonts/files/the%20fonts/final/trebuc32.exe
sha:5a690d9bb8510be1b8b4fe49f1f2319651fe51bbe54775ddddd8ef0bd07fdac9
https://sourceforge.net/projects/corefonts/files/the%20fonts/final/times32.exe
sha:db56595ec6ef5d3de5c24994f001f03b2a13e37cee27bc25c58f6f43e8f807ab
https://sourceforge.net/projects/corefonts/files/the%20fonts/final/impact32.exe
sha:6061ef3b7401d9642f5dfdb5f2b376aa14663f6275e60a51207ad4facf2fccfb
https://sourceforge.net/projects/corefonts/files/the%20fonts/final/georgi32.exe
sha:2c2c7dcda6606ea5cf08918fb7cd3f3359e9e84338dc690013f20cd42e930301
https://sourceforge.net/projects/corefonts/files/the%20fonts/final/courie32.exe
sha:bb511d861655dde879ae552eb86b134d6fae67cb58502e6ff73ec5d9151f3384
https://sourceforge.net/projects/corefonts/files/the%20fonts/final/comic32.exe
sha:9c6df3feefde26d4e41d4a4fe5db2a89f9123a772594d7f59afd062625cd204e
https://sourceforge.net/projects/corefonts/files/the%20fonts/final/arialb32.exe
sha:a425f0ffb6a1a5ede5b979ed6177f4f4f4fdef6ae7c302a7b7720ef332fec0a8
https://sourceforge.net/projects/corefonts/files/the%20fonts/final/arial32.exe
sha:85297a4d146e9c87ac6f74822734bdee5f4b2a722d7eaa584b7f2cbf76f478f6
https://sourceforge.net/projects/corefonts/files/the%20fonts/final/andale32.exe
sha:0524fe42951adc3a7eb870e32f0920313c71f170c859b5f770d82b4ee111e970
{% endblock %}

{% block bld_tool %}
bin/cabextract
{% endblock %}

{% block build %}
for x in ${src}/*.exe; do
    cabextract -L ${x}
done

for x in *.cab; do
    cabextract -L ${x}
done
{% endblock %}
