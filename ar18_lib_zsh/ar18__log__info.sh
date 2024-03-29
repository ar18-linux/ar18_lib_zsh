#!/usr/bin/env zsh


function _ar18__log__info(){


  function ar18__log__info(){
    dbg_val="$1"
    date_time=$(ar18__date_time__get_timestamp)
    echo -e "\n[${date_time}] [$3] [$2]\n[\e[34mINFO\e[0m] ${dbg_val}\n"
    if [[ "${std_log-x}" != "x" ]]; then
      echo -e "\n[${date_time}] [$3] [$2]\n[INFO] ${dbg_val}\n" >> "${std_log}"
    fi
    if [[ "${4-x}" != "x" ]]; then
      echo -e "\n[${date_time}] [$3] [$2]\n[INFO] ${dbg_val}\n" >> "$3"
    fi
  }


  local script_dir_func="script_dir_${${(%):-%N}%%.*}"
  local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"
  
  . "${(P)script_dir_func}/ar18__date_time__get_timestamp.sh"
  
}


type ar18__log__info > /dev/null || _ar18__log__info
