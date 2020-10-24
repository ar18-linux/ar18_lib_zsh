

function _ar18__date_time__get_timestamp(){


  function ar18__date_time__get_timestamp(){
    date -u +"%Y-%m-%d %H:%M:%S.%3N"
  }
  
  #local script_dir_${${(%):-%N}%%.*}
  #local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"

  #.

}


type ar18__date_time__get_timestamp > /dev/null || _ar18__date_time__get_timestamp
