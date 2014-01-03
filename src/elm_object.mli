(** elm_object_* Elm_Object_* *)

(** {2 Cursors} *)

val cursor_set : Evas.obj -> string -> unit

val cursor_get : Evas.obj -> string

val cursor_unset : Evas.obj -> unit

val cursor_style_set : Evas.obj -> string -> unit

val cursor_style_get : Evas.obj -> string

val cursor_theme_search_enabled_set : Evas.obj -> bool -> unit

val cursor_theme_search_enabled_get : Evas.obj -> bool

(** {2 Debug} *)

val tree_dump : Evas.obj -> unit

val tree_dot_dump : Evas.obj -> string -> unit

(** {2 Other} *)

type item

type select_mode = [`default | `always | `none | `display_only]

val part_text_set : Evas.obj -> ?p:string -> string -> unit

val part_text_get : Evas.obj -> ?p:string -> unit -> string

val part_content_set : Evas.obj -> ?p:string -> Evas.obj -> unit 

val part_content_set_null : Evas.obj -> ?p:string -> unit -> unit

val part_content_get : Evas.obj -> ?p:string -> unit -> Evas.obj

val part_content_unset : Evas.obj -> ?p:string -> unit -> Evas.obj

val signal_emit : Evas.obj -> string -> string -> unit

val signal_callback_add : Evas.obj -> string -> string -> Edje.signal_cb -> unit

val signal_callback_del : Evas.obj -> string -> string -> Edje.signal_cb -> unit

val text_set : Evas.obj -> string -> unit

val style_set : Evas.obj -> string -> bool

val content_set : Evas.obj -> Evas.obj -> unit

val text_get : Evas.obj -> string

val content_unset : Evas.obj -> Evas.obj

val disabled_set : Evas.obj -> bool -> unit

val disabled_get : Evas.obj -> bool

val focus_set : Evas.obj -> bool -> unit

val parent_widget_get : Evas.obj -> Evas.obj option

val top_widget_get : Evas.obj -> Evas.obj option

val item_of_ptr : Evas.ptr -> item

val item_del : item -> unit

val item_disabled_set : item -> bool -> unit

val item_text_get : item -> string

val item_content_set : item -> Evas.obj -> unit

val item_widget_get : item -> Evas.obj

