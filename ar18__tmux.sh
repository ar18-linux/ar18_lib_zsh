

function _ar18__tmux(){


  function ar18__tmux(){
    return
  }


  local script_dir_${${(%):-%N}%%.*}
  local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"

  . "${(P)script_dir_func}/ar18__tmux__format_line.sh"
  . "${(P)script_dir_func}/ar18__tmux__format_module.sh"
  
}


type ar18__tmux > /dev/null || _ar18__tmux
