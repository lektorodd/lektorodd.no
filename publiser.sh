#!/usr/bin/env bash
# ============================================================
#  publiser.sh - render lektorodd.no og last opp til one.com
#
#  Bruk:
#    ./publiser.sh          render og last opp
#    ./publiser.sh --prov   render og vis kva som VILLE blitt lasta opp
#    ./publiser.sh --berre-opplasting   hopp over render
#
#  Tryggleik:
#    - Skriptet slettar aldri noko på serveren. Det lastar berre opp
#      filer frå _site/ som er nye eller endra. Appane, ki/, s1/ osb.
#      som ligg der fra før, blir verande.
#    - Passordet ligg i macOS-nøkkelringen, ikkje i repoet.
#    - Før opplasting sjekkar skriptet at mappa på serveren faktisk er
#      lektorodd.no (at index.html og lf.html finst der).
#
#  Oppsett ein gong:
#    1) brew install lftp
#    2) Lagre SFTP-passordet frå one.com i nøkkelringen:
#         security add-generic-password -a "lektorodd.no" -s lektorodd-sftp -w
#       (du blir spurd om passordet; det blir ikkje ståande i historikken)
#    3) Sjekk at SFTP_VERT, SFTP_BRUKAR og MAPPE under stemmer med det
#       one.com viser under FTP/SFTP i kontrollpanelet. Skriptet brukar
#       berre SFTP (kryptert). SSH-tilgang trengst ikkje.
#    4) Køyr ./publiser.sh --prov første gong.
# ============================================================
set -euo pipefail

SFTP_VERT="${SFTP_VERT:-ssh.lektorodd.no}"
SFTP_BRUKAR="${SFTP_BRUKAR:-lektorodd.no}"
MAPPE="${MAPPE:-/www}"
NOKKEL="lektorodd-sftp"

PROV=0
RENDER=1
for arg in "$@"; do
  case "$arg" in
    --prov) PROV=1 ;;
    --berre-opplasting) RENDER=0 ;;
    *) echo "Ukjent val: $arg" >&2; exit 2 ;;
  esac
done

cd "$(dirname "$0")"

command -v lftp >/dev/null || { echo "Manglar lftp. Installer med: brew install lftp" >&2; exit 1; }

if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
  echo "Merk: du har endringar som ikkje er committa. Det som blir lasta opp, er ikkje det same som i git."
fi

if [ "$RENDER" = 1 ]; then
  echo "Renderer ..."
  quarto render
fi

[ -f _site/index.html ] || { echo "Fann ikkje _site/index.html. Har renderen gått gjennom?" >&2; exit 1; }

# Passord frå nøkkelringen. Finst det ikkje, spør lftp sjølv.
if LFTP_PASSWORD="$(security find-generic-password -a "$SFTP_BRUKAR" -s "$NOKKEL" -w 2>/dev/null)"; then
  export LFTP_PASSWORD
  OPNE="open --env-password -u $SFTP_BRUKAR sftp://$SFTP_VERT"
else
  echo "Fann ikkje passord i nøkkelringen ($NOKKEL). Du blir spurd om det no."
  OPNE="open -u $SFTP_BRUKAR sftp://$SFTP_VERT"
fi

OPPSETT="set sftp:auto-confirm yes; set net:max-retries 2; set net:timeout 20"

echo "Sjekkar at $MAPPE på $SFTP_VERT er lektorodd.no ..."
if ! lftp -c "$OPPSETT; $OPNE; cd $MAPPE; cls -1 index.html lf.html" >/dev/null 2>&1; then
  echo "Fann ikkje index.html og lf.html i $MAPPE på serveren. Avbryt." >&2
  echo "Dette ligg der du hamnar etter innlogging:" >&2
  lftp -c "$OPPSETT; $OPNE; cls -1" >&2 || echo "(kom ikkje inn: sjekk SFTP_VERT, SFTP_BRUKAR og passord)" >&2
  echo "Set MAPPE øvst i skriptet til mappa som har index.html, til dømes MAPPE=/ eller MAPPE=/www." >&2
  exit 1
fi

SPEGL="mirror --reverse --only-newer --no-perms --parallel=4 --verbose --exclude-glob .DS_Store _site/ $MAPPE"
if [ "$PROV" = 1 ]; then
  echo "Prøvekøyring. Ingenting blir lasta opp:"
  lftp -c "$OPPSETT; $OPNE; $SPEGL --dry-run"
else
  echo "Lastar opp ..."
  lftp -c "$OPPSETT; $OPNE; $SPEGL"
  echo "Ferdig: https://lektorodd.no"
fi
