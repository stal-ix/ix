Personal Arc client overlay, installed as an additional system-realm package:
  ./ix mut system +set/pg/arc

set/pg/arc/client imports a COPY of /home/pg/arc-musl/arc into the package and
checks the expected SHA256. This is a local artifact import, so its build
needs access to that file outside the normal source isolation. The binary
is not stored in this repository and cannot be rebuilt by public CI without
the separately obtained artifact. It was built on merlin with ya make -r
--musl at fb40f49c3c90952ad54c896c9ad83f13239eab82.

bin/fusermount/sud provides the non-setuid helper bridge using existing sud.
No dependency or configuration is added to set/pg/system.

On the actual home host, as pg:
  arc mount /home/pg/1
  arc unmount /home/pg/1

Arc uses its existing user credentials and store under /home/pg/.arc.
Do not recursively scan the mounted repository; inspect known paths only.

Corporate DNS and explicit VPN routes must reach these service endpoints:
  arc-vcs.yandex-team.ru:5624
  pulld.arc-vcs.yandex-team.ru:7059
  crypto.arc-vcs.yandex-team.ru:5629
  arcanum.yandex.net:443
Their current addresses are recorded in home's VPN config.json routes.
Update those routes if the endpoint addresses change.
