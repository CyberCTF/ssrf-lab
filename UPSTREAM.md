# Upstream

| | |
| --- | --- |
| Project | SSRF Vulnerable Lab |
| Repository | https://github.com/incredibleindishell/SSRF_Vulnerable_Lab |
| Version | master (no release tags) |
| Commit | 7b9a3a1caf7fab5904232478dd41c62a166376a3 |
| Licence | MIT |

`build/web/app/` is that commit, unchanged, without its Git history. `build/web/Dockerfile` is
upstream's Dockerfile with two fixes so it still builds: apt reads archive.debian.org (the
`php:7.2-apache` base is Debian 10, whose packages left the main mirrors), and pip installs
WeasyPrint 0.42.3 (what `weasyprint<43` resolves to) with its Python 2 dependencies pinned.
`app/Host_header/` (a separate Host header scenario with its own server configuration) is not
part of the image, as upstream's Dockerfile only adds `www/`. To update, replace
`build/web/app/` with a newer commit, then change this table.
