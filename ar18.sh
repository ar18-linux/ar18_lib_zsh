

function _ar18(){


  function ar18(){
    return
  }
  

  local script_dir_func="script_dir_${${(%):-%N}%%.*}"
  local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"

  . "${(P)script_dir_func}/ar18__date_time.sh"
  . "${(P)script_dir_func}/ar18__file.sh"
  . "${(P)script_dir_func}/ar18__log.sh"
  . "${(P)script_dir_func}/ar18__script.sh"
  . "${(P)script_dir_func}/ar18__string.sh"
  . "${(P)script_dir_func}/ar18__tmux.sh"
  
}

type ar18 > /dev/null || _ar18
