set pagination off
set confirm off
set logging file xajh-stage11-gamedata.log
set logging overwrite on
set logging redirect on
set logging on

# xajh glinkd is a 32-bit ET_EXEC binary.  This is
# GNET::GamedataSend::Process(GNET::PManager *, unsigned int).
break *0x081f7a9e
commands
  silent
  set $gd_obj = *(unsigned int *)($esp + 4)
  set $gd_data = *(unsigned int *)($gd_obj + 8)
  set $gd_len = *(unsigned int *)($gd_data - 8)
  if $gd_len >= 2
    set $gd_cmd = *(unsigned short *)$gd_data
    if $gd_cmd == 10
      printf "C2S_GAME_DATA command=10 length=%u target-select\n", $gd_len
      x/10bx $gd_data
    end
    if $gd_cmd == 31
      printf "C2S_GAME_DATA command=31 length=%u cast-skill\n", $gd_len
      x/38bx $gd_data
    end
  end
  continue
end

continue
