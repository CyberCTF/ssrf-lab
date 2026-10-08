# SSRF Vulnerable Lab

[SSRF Vulnerable Lab](https://github.com/incredibleindishell/SSRF_Vulnerable_Lab) by
incredibleindishell and contributors: PHP pages vulnerable to server-side request forgery in
several scenarios (file content fetch, remote host connect, file download, DNS spoofing and DNS
rebinding bypasses of an IP blacklist, HTML to PDF generators, XML). This repository runs it
with [Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machine, and
the upstream source in [`build/web/app/`](build/web/app) builds with its own Dockerfile (pointed
at the Debian archive, with the Python 2 PDF dependencies pinned).

| Machine | Service |
| --- | --- |
| web | The SSRF scenarios (Apache, PHP 7.2) on port 80 |

The lab network reaches the internet, because the DNS spoofing and DNS rebinding scenarios
resolve real domain names.

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost/. The same spec runs as Docker on a local VM (`docker-vm`), on a cloud
VM (`cloud-docker`) or on Kubernetes. Lab guide: the per-scenario exploitation guides linked
from [upstream's README](https://github.com/incredibleindishell/SSRF_Vulnerable_Lab#readme).

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

MIT, as SSRF Vulnerable Lab ([LICENSE](LICENSE)). This application is deliberately vulnerable:
keep it isolated.
