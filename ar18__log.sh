

function _ar18__log(){


  function ar18__log(){
    return
  }

#
  local script_dir_${${(%):-%N}%%.*}
  local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"

  . "${(P)script_dir_func}/ar18__log__dbg.sh"
  . "${(P)script_dir_func}/ar18__log__err.sh"
  . "${(P)script_dir_func}/ar18__log__fatal.sh"
  . "${(P)script_dir_func}/ar18__log__info.sh"
  . "${(P)script_dir_func}/ar18__log__prompt.sh"
  . "${(P)script_dir_func}/ar18__log__success.sh"
  . "${(P)script_dir_func}/ar18__log__warn.sh"
  
}


type ar18__log > /dev/null || _ar18__log
