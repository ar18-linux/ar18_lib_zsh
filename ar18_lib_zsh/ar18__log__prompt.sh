#!/usr/bin/env zsh


function _ar18__log__prompt(){


  function ar18__log__prompt(){
    dbg_val="$1"
    date_time=$(ar18__date_time__get_timestamp)
    tput bel
    echo -e "\n[${date_time}] [$3] [$2]\n[\e[44mASK \e[0m] ${dbg_val}\n"
    read -r some_stuff
  }


  local script_dir_func="script_dir_${${(%):-%N}%%.*}"
  local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"
  
  . "${(P)script_dir_func}/ar18__date_time__get_timestamp.sh"
  
}


type ar18__log__dbg > /dev/null || _ar18__log__prompt
