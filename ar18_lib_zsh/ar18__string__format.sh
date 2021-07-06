#!/usr/bin/env zsh
# ar18


function _ar18__string__format(){


  function ar18__string__format(){
    return
  }


  local script_dir_func="script_dir_${${(%):-%N}%%.*}"
  local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"

  . "${(P)script_dir_func}/ar18__string__format__bytes_to_human.sh"
  . "${(P)script_dir_func}/ar18__string__format__percentage.sh"
  . "${(P)script_dir_func}/ar18__string__format__percentage_fixed.sh"
  
}


type ar18__string__format > /dev/null || _ar18__string__format
