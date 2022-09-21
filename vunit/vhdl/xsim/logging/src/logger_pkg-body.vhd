-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this file,
-- You can obtain one at http://mozilla.org/MPL/2.0/.
--
-- Copyright (c) 2014-2022, Lars Asplund lars.anders.asplund@gmail.com

package body logger_pkg is

  procedure info(msg : string;
                 line_num : natural := 0;
                 file_name : string := "") is
  begin
    report(msg);
  end procedure;

  constant default_logger : logger_t := null_logger;

  procedure log(logger : logger_t;
                msg : string;
                log_level : log_level_t := info;
                path_offset : natural := 0;
                line_num : natural := 0;
                file_name : string := "") is
  begin
    report(msg);
  end procedure;

  procedure log(msg : string;
                log_level : log_level_t := info;
                path_offset : natural := 0;
                line_num : natural := 0;
                file_name : string := "") is
  begin
    log(default_logger, msg, log_level, path_offset + 1, line_num, file_name);
  end;

  impure function is_visible(logger : logger_t;
                             log_level : log_level_t) return boolean is
  begin
    return true;
  end;

  impure function get_logger(name : string;
                             parent : logger_t := null_logger) return logger_t is
  begin
    return null_logger;
  end;

end package body;
