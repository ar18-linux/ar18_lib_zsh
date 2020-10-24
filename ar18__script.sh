

function _ar18__script(){


  function ar18__script(){
    return
  }


  local script_dir_${${(%):-%N}%%.*}
  local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"

  . "${(P)script_dir_func}/ar18__script__check_vars_needed.sh"
  
}


type ar18__script > /dev/null || _ar18__script
