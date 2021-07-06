#!/usr/bin/env zsh


function _ar18__script__check_vars_needed(){


  function ar18__script__check_vars_needed(){
    vars_needed=("$@")
    vars_all_assigned="1"
    for var in "${vars_needed[@]}"; do
      val_evaled="$(eval "echo \$${var}")"
      if [[ "$val_evaled" == "" ]]; then
        vars_all_assigned="0"
        ar18__log__warn "not assigned: ${var}" "$((${funcsourcetrace[-1]#*:} + LINENO))" "${"$(readlink -f "${(%):-%x}" | awk -F/ '{print $(NF-1) "/" $NF}')"}" 
      fi
    done
    if [[ "${vars_all_assigned}" == "0" ]]; then
      ar18__log__fatal "some vars have not been assigned" "$((${funcsourcetrace[-1]#*:} + LINENO))" "${"$(readlink -f "${(%):-%x}" | awk -F/ '{print $(NF-1) "/" $NF}')"}" 
    fi
  }


  local script_dir_func="script_dir_${${(%):-%N}%%.*}"
  local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"
  
  . "${(P)script_dir_func}/ar18__log__warn.sh"
  . "${(P)script_dir_func}/ar18__log__fatal.sh"

}


type ar18__script__check_vars_needed > /dev/null || _ar18__script__check_vars_needed
