type animation_setting = [`start | `loop | `stop | `last]

external add : Evas.obj -> Evas.obj = "ml_elm_thumb_add"

external reload : Evas.obj -> unit = "ml_elm_thumb_reload"

external file_set : Evas.obj -> string -> string -> unit =
  "ml_elm_thumb_file_set"

external file_get : Evas.obj -> string * string = "ml_elm_thumb_file_get"

external path_get : Evas.obj -> string * string = "ml_elm_thumb_path_get"

external animate_set : Evas.obj -> animation_setting -> unit =
  "ml_elm_thumb_animate_set"

external animate_get : Evas.obj -> animation_setting =
  "ml_elm_thumb_animate_get"

