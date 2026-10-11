#!/bin/sh
# Places the player's flag (CTF_FLAG_MAIN, given by the launcher) outside the web root, where the server-side fetch of a local URL reaches it;
# without one (CI, a run by hand) the development flag.
dev='FLAG{dev-ssrf-lab}'
printf '%s\n' "${CTF_FLAG_MAIN:-$dev}" > /ctf/flag
chmod 444 /ctf/flag
