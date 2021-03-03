#!/bin/zsh
# TODO: hacky as hell, doesn't update count only appends

RECENT_PATH="${XDG_RECENTS_PATH:=$XDG_DATA_HOME/recently-used.xbel}"
BODY="$(head -n -1 $RECENT_PATH)"
cat > $RECENT_PATH <<- EOM
$BODY
  <bookmark href="file://$(realpath $1)" modified="$(date -u -Ins)" visited="$(date -u -Ins)">
    <info>
      <metadata owner="http://freedesktop.org">
        <mime:mime-type type="application/octet-stream"/>
        <bookmark:applications>
          <bookmark:application name="make_recent script" exec="" modified="2021-02-28T00:00:00Z" count="1"/>
        </bookmark:applications>
      </metadata>
    </info>
  </bookmark>
</xbel>
EOM

