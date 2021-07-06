#!/usr/bin/env zsh


function _ar18__date_time__get_timestamp_file(){


  function ar18__date_time__get_timestamp_file(){
    date -u +"%Y-%m-%d_%H-%M-%S-%3N"
  }
  
  #local script_dir_func="script_dir_${${(%):-%N}%%.*}"
  #local declare "${script_dir_func}"="$(cd "$(dirname "$(readlink -f "${(%):-%x}")")" >/dev/null 2>&1 && pwd)"

  #.

}


type ar18__date_time__get_timestamp_file > /dev/null || _ar18__date_time__get_timestamp_file
